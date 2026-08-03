# Captures every screenshot used by the frab client manual.
#
#   bundle exec rails runner doc/manual/collect_ids.rb        # once, after demo:seed
#   bundle exec rails server -p 3010                          # in another shell
#   FRAB_URL=http://127.0.0.1:3010 bundle exec ruby doc/manual/capture_screenshots.rb
#
# PNGs land in doc/manual/screenshots/ and are named after the manual section
# they belong to, so they can be reused for other documents.
#
# Optional environment:
#   FRAB_URL       base url of a running frab (default http://127.0.0.1:3010)
#   CHROMEDRIVER   path to a chromedriver binary matching the local Chrome
#   ONLY           substring filter, e.g. ONLY=mail to re-shoot a single chapter

require 'bundler/setup'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'json'
require 'fileutils'

BASE_URL  = ENV.fetch('FRAB_URL', 'http://127.0.0.1:3010')
ROOT      = File.expand_path('..', __dir__)          # doc/
OUT_DIR   = File.join(__dir__, 'screenshots')
IDS       = JSON.parse(File.read(File.join(__dir__, 'ids.json')))
ACRONYM   = IDS['conference']
PASSWORD  = 'test123'
ONLY      = ENV['ONLY']
WIDTH     = 1440
MAX_HEIGHT = 1900

FileUtils.mkdir_p(OUT_DIR)

Capybara.register_driver :manual_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  %w[--headless=new --hide-scrollbars --disable-gpu --no-sandbox --disable-dev-shm-usage
     --disable-extensions --force-device-scale-factor=2 --lang=en-US
     --window-size=1440,1000].each { |a| options.add_argument(a) }
  options.add_preference('intl.accept_languages', 'en-US,en')

  if ENV['CHROMEDRIVER']
    service = Selenium::WebDriver::Service.chrome(path: ENV['CHROMEDRIVER'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, service: service)
  else
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end

Capybara.default_driver    = :manual_chrome
Capybara.app_host          = BASE_URL
Capybara.run_server        = false
Capybara.default_max_wait_time = 8

include Capybara::DSL

$shots  = []
$failed = []
$current_login = nil

# --- helpers ---------------------------------------------------------------

def browser
  page.driver.browser
end

# Screenshots are taken at the full document height (capped), so a long list
# ends up on one image instead of being cut off at the fold.
def grow_window
  height = browser.execute_script(
    'return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);'
  ).to_i
  height = 700 if height < 700
  height = MAX_HEIGHT if height > MAX_HEIGHT
  browser.manage.window.resize_to(WIDTH, height + 120)
  sleep 0.35
end

# Draws a red frame around the element the manual is talking about.
def highlight(selector)
  browser.execute_script(<<~JS, selector)
    var nodes = document.querySelectorAll(arguments[0]);
    for (var i = 0; i < nodes.length; i++) {
      nodes[i].style.outline = '3px solid #e2001a';
      nodes[i].style.outlineOffset = '2px';
      nodes[i].style.borderRadius = '2px';
    }
  JS
  sleep 0.2
end

HAVE_IMAGEMAGICK = system('which convert > /dev/null 2>&1')

# frab's layout reserves a full viewport height, so a short page still produces
# a very tall screenshot. ImageMagick cuts the empty area off the bottom and
# leaves a small margin in the page's own background colour.
def trim_bottom(file)
  return unless HAVE_IMAGEMAGICK

  system('bash', '-c', <<~SH)
    set -e
    bg=$(convert "#{file}" -format '%[pixel:p{0,h-1}]' info:)
    convert "#{file}" -fuzz 1% -define trim:edges=south -trim +repage \
            -background "$bg" -gravity south -splice 0x28 "#{file}"
  SH
end

def hide_noise
  browser.execute_script(<<~JS)
    document.querySelectorAll('.flash, #flash, .alert-message').forEach(function (n) { n.style.display = 'none'; });
  JS
rescue StandardError
  nil
end

# Headless Chrome occasionally dies on a heavy page. Rather than losing the
# rest of the run, the browser is restarted and the shot retried once.
def restart_browser
  Capybara.current_session.driver.quit
rescue StandardError
  nil
ensure
  Capybara.reset_sessions!
  login_as($current_login) if $current_login
end

BROWSER_DEATH = [
  Selenium::WebDriver::Error::InvalidSessionIdError,
  Selenium::WebDriver::Error::NoSuchWindowError,
  Selenium::WebDriver::Error::UnknownError
].freeze

def shot(name, path = nil, highlight_selector: nil, wait_for: nil, keep_flash: false)
  return if ONLY && !name.include?(ONLY)

  attempts = 0
  begin
    attempts += 1
    visit(path) if path
    page.has_css?('body', wait: 5)
    if wait_for
      page.has_css?(wait_for, wait: 8) or warn("  ! #{name}: '#{wait_for}' never appeared")
    end
    yield if block_given?
    hide_noise unless keep_flash
    highlight(highlight_selector) if highlight_selector
    grow_window
    file = File.join(OUT_DIR, "#{name}.png")
    page.save_screenshot(file)
    trim_bottom(file)
    $shots << name
    puts format('  %-52s %s', name, path || '(interaction)')
  rescue *BROWSER_DEATH => e
    if attempts < 3
      warn "  (browser died on #{name}, restarting: #{e.class})"
      restart_browser
      retry
    end
    $failed << "#{name}: #{e.class}"
    warn "  ! FAILED #{name}: #{e.class}"
  rescue StandardError => e
    $failed << "#{name}: #{e.class} #{e.message.lines.first.to_s.strip}"
    warn "  ! FAILED #{name}: #{e.class} #{e.message.lines.first}"
  end
end

def logout
  browser.manage.delete_all_cookies
  visit '/users/sign_in'
end

def login_as(email)
  4.times do |attempt|
    begin
      logout
      page.has_css?('#user_password', wait: 8)
      fill_in 'user_email',    with: email
      fill_in 'user_password', with: PASSWORD
      begin
        find('#new_user input[name=commit]', match: :first).click
      rescue StandardError
        # clicking occasionally does not register in headless Chrome;
        # submitting the form from JavaScript is the reliable fallback
        browser.execute_script("document.getElementById('new_user').submit();")
      end
      unless page.has_no_css?('#user_password', wait: 4)
        browser.execute_script("var f=document.getElementById('new_user'); if (f) f.submit();")
      end
      # a silently failed login would produce a folder full of login
      # screenshots, so this is checked instead of just waited on
      if page.has_no_css?('#user_password', wait: 10)
        $current_login = email
        puts "  (logged in as #{email})"
        return
      end
      warn "  retrying login for #{email} (attempt #{attempt + 1})"
    rescue StandardError => e
      warn "  retrying login for #{email} (attempt #{attempt + 1}): #{e.class}"
      Capybara.reset_sessions! if BROWSER_DEATH.include?(e.class)
    end
    sleep 1
  end
  raise "login failed for #{email} - check the password"
end

def chapter(title)
  return if ONLY && !title.downcase.include?(ONLY.downcase) && !ONLY.empty?
  puts "\n== #{title}"
end

def c(path)
  "/#{ACRONYM}#{path}"
end

# --- 0. getting started ----------------------------------------------------

puts "Capturing against #{BASE_URL}"
puts "\n== 00 getting started"

logout
shot('00-01-login', '/users/sign_in', highlight_selector: '#new_user')

login_as('orga@example.org')

shot('00-02-conference-list', '/conferences')
shot('00-03-conference-dashboard', c(''))
shot('00-04-main-navigation', c(''), highlight_selector: '.navbar, #navi, nav')
shot('00-05-new-conference', '/conferences/new')

# --- 1. settings -----------------------------------------------------------

puts "\n== 01 settings"

shot('01-01-settings-tabs', c('/conference/edit'), highlight_selector: '.tabs, ul.nav-tabs')
shot('01-02-settings-general', c('/conference/edit'))
shot('01-03-settings-days', c('/conference/edit_days'))
shot('01-04-settings-rooms', c('/conference/edit_rooms'))
shot('01-05-settings-tracks', c('/conference/edit_tracks'))
shot('01-06-settings-schedule', c('/conference/edit_schedule'))
shot('01-07-settings-classifiers', c('/conference/edit_classifiers'))
shot('01-08-settings-review-metrics', c('/conference/edit_review_metrics'))
shot('01-09-settings-notifications', c('/conference/edit_notifications'))
shot('01-10-settings-ticket-server', c('/conference/edit_ticket_server'))
shot('01-11-conference-users', '/conference_users')

# --- 2. call for participation --------------------------------------------

puts "\n== 02 call for participation"

shot('02-01-cfp-settings', c('/call_for_participation/edit'))
shot('02-02-cfp-overview', c('/call_for_participation'))

login_as(IDS['speaker_email'])
shot('02-03-cfp-submitter-welcome', c('/cfp'))
shot('02-04-cfp-submitter-profile', c('/cfp/person/edit'))
shot('02-05-cfp-submitter-availability', c('/cfp/person/availability/edit'))
shot('02-06-cfp-submitter-my-sessions', c('/cfp/events'))
shot('02-07-cfp-submitter-new-session', c('/cfp/events/new'))

login_as('orga@example.org')

# --- 3. people -------------------------------------------------------------

puts "\n== 03 people"

shot('03-01-people-list', c('/people'))
shot('03-02-people-all', c('/people/all'))
shot('03-03-people-speakers', c('/people/speakers'))
shot('03-04-person-show', c("/people/#{IDS['person_id']}"))
shot('03-05-person-edit', c("/people/#{IDS['person_id']}/edit"))
shot('03-06-person-availability', c("/people/#{IDS['person_id']}/availability/edit"))
shot('03-07-person-expenses', c("/people/#{IDS['expenses_person_id']}/expenses"))
shot('03-08-person-transport-needs', c("/people/#{IDS['expenses_person_id']}/transport_needs"))
# the "feedback for one speaker" page is routed as a collection action but
# reads params[:id], so it has to be called with an explicit id
shot('03-09-person-feedback', c("/people/feedbacks?id=#{IDS['person_id']}"))

# --- 4. sessions -----------------------------------------------------------

puts "\n== 04 sessions"

shot('04-01-session-list', c('/events'))
shot('04-02-session-list-tabs', c('/events'), highlight_selector: '.tabs, ul.nav-tabs')
# the modals and the bulk mail form sit at the very bottom of a 70+ row list,
# so these three shots use a filtered (short) list to stay readable
shot('04-03-session-filter-modal', c('/events?term=keynote')) do
  find('.filter_icon', match: :first).click
  page.has_css?('#events-modal', visible: true, wait: 6)
end
shot('04-04-session-show', c("/events/#{IDS['event_id']}"))
shot('04-05-session-edit', c("/events/#{IDS['event_id']}/edit"))
shot('04-06-session-people', c("/events/#{IDS['event_id']}/edit_people"))
shot('04-07-session-attachments', c('/events/attachments'))
shot('04-08-session-history', c("/events/#{IDS['event_id']}/history"))
shot('04-09-session-bulk-edit', c('/events?term=keynote')) do
  find('a.show_events_modal:not(.filter_icon)', match: :first).click
  page.has_css?('#events-modal', visible: true, wait: 6)
end
shot('04-10-session-new', c('/events/new'))
shot('04-11-session-feedback', c('/events/feedbacks'))
shot('04-12-recent-changes', c('/recent_changes'))

# --- 5. reports ------------------------------------------------------------

puts "\n== 05 reports"

shot('05-01-reports-index', c('/reports'))
shot('05-02-report-events-example', c('/reports/on_events/events_without_speaker'))
shot('05-03-report-people-example', c('/reports/on_people/speakers_without_availabilities'))
shot('05-04-report-expenses', c('/reports/on_people/people_with_non_reimbursed_expenses'))
shot('05-05-report-transport', c('/reports/on_transport_needs/all'))
shot('05-06-report-statistics', c('/reports/on_statistics/events_by_track'))
shot('05-09-report-accepted-papers', c('/reports/on_events/accepted_paper_presentations'))
# the live charts live on the conference dashboard, not behind their own url
shot('05-07-statistics-sessions-by-state', c(''), highlight_selector: '#event_state_graph')
shot('05-08-statistics-language-and-gender', c(''), highlight_selector: '#event_language_graph, #event_gender_graph')

# --- 6. schedule -----------------------------------------------------------

puts "\n== 06 schedule"

shot('06-01-schedule-grid', c('/schedule'), wait_for: '.schedule, table')
shot('06-02-schedule-unscheduled', c('/schedule'), highlight_selector: '#unscheduled_events, .unscheduled')
shot('06-03-schedule-pdf-export', c('/schedule/new_pdf'))
shot('06-04-schedule-html-export', c('/schedule/html_exports'))
shot('06-05-public-schedule', c('/public/schedule'))
shot('06-06-public-schedule-day', c("/public/schedule/#{IDS['day_index']}"))
shot('06-07-public-event', c("/public/events/#{IDS['event_id']}"))
shot('06-08-public-speakers', c('/public/speakers'))

# --- 7. reviews, part 1: what an orga sees ---------------------------------

puts "\n== 07 reviews (orga view)"

shot('07-04-review-metrics-columns', c('/events/ratings'))

# --- 8. mail templates -----------------------------------------------------

puts "\n== 08 mail templates"

shot('08-01-mail-templates-list', c('/mail_templates'))
shot('08-02-mail-template-new', c('/mail_templates/new'), highlight_selector: 'form')
shot('08-03-mail-template-placeholders', c('/mail_templates/new'), highlight_selector: '.col.offset8, #variable_subst_help')
shot('08-04-mail-template-show', c("/mail_templates/#{IDS['mail_template_id']}"))
shot('08-05-mail-template-send', c("/mail_templates/#{IDS['mail_template_id']}"), highlight_selector: 'form select, #send_filter')
shot('08-06-mail-template-edit', c("/mail_templates/#{IDS['mail_template_id']}/edit"))
shot('08-07-notification-templates', c('/conference/edit_notifications'))
shot('08-08-bulk-mail-from-list', c('/events?term=keynote'), highlight_selector: '#send_bulk_mail_form') do
  find('a[href="#send_bulk_mail_form"]', match: :first).click
  page.has_css?('#send_bulk_mail_form', visible: true, wait: 6)
end
shot('08-09-session-custom-notification', c("/events/#{IDS['event_id']}"), highlight_selector: 'form[action*="custom_notification"], .custom_notification')

# --- 7. reviews, part 2: what a reviewer sees ------------------------------
# runs last, because it is the only chapter that needs a different account

puts "\n== 07 reviews (reviewer view)"

login_as('reviewer@example.org')
shot('07-00-reviewer-session-list', c('/events'))
shot('07-01-review-queue', c('/events/start_review'))
shot('07-02-review-form', c("/events/#{IDS['review_event_id']}/event_rating"))
shot('07-03-review-ratings-overview', c('/events/ratings'))

# --- done ------------------------------------------------------------------

puts "\n#{$shots.size} screenshots written to #{OUT_DIR}"
unless $failed.empty?
  puts "\n#{$failed.size} failed:"
  $failed.each { |f| puts "  - #{f}" }
end

Capybara.current_session.driver.quit
exit($failed.empty? ? 0 : 1)
