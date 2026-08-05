namespace :demo do
  DEMO_ACRONYMS = %w(demo2026 rubyroom demo2025).freeze
  DEMO_PASSWORD = 'test123'.freeze

  desc 'build a complete, clickable demo setup (conferences, crew, speakers, submissions in every state)'
  task seed: :environment do
    PaperTrail.enabled = false
    ActionMailer::Base.delivery_method = :test

    DemoSeed.new.run
  end

  desc 'remove everything demo:seed created'
  task clean: :environment do
    PaperTrail.enabled = false
    DemoSeed.new.wipe
    puts 'Demo data removed.'
  end
end

# Builds a coherent demo data set: two conferences (one upcoming with an open
# CfP, one past with a public schedule and feedback), a sub-conference/devroom,
# crew users for every role, speakers, and submissions covering every state of
# the event state machine.
class DemoSeed
  CREW = [
    { email: 'orga@example.org',        name: 'Olivia Orga',        role: 'orga' },
    { email: 'coordinator@example.org', name: 'Karlo Koordinator',  role: 'coordinator' },
    { email: 'reviewer@example.org',    name: 'Rina Recenzent',     role: 'reviewer' },
    { email: 'reviewer2@example.org',   name: 'Robert Recenzent',   role: 'reviewer' }
  ].freeze

  # name, gender - gender feeds the "gender breakdown" statistics page
  SPEAKERS = [
    ['Ana Horvat',       'female'], ['Marko Kovac',      'male'],
    ['Ivana Novak',      'female'], ['Petar Babic',      'male'],
    ['Lucija Maric',     'female'], ['Tomislav Juric',   'male'],
    ['Sara Vukovic',     'female'], ['Filip Knezevic',   'male'],
    ['Maja Petrovic',    'female'], ['Luka Matic',       'male'],
    ['Nina Radic',       'female'], ['Josip Bozic',      'male'],
    ['Elena Sokolova',   'female'], ['Diego Fernandez',  'male'],
    ['Amara Okafor',     'female'], ['Jonas Lindqvist',  'male'],
    ['Priya Raman',      'female'], ['Mehmet Yilmaz',    'male'],
    ['Clara Dubois',     'female'], ['Kenji Tanaka',     'male'],
    ['Robin Vermeer',    'other'],  ['Sofia Rossi',      'female']
  ].freeze

  # indices into SPEAKERS who consistently fall behind on their required peer
  # reviews - in every conference they submit to, kept deliberately below the
  # 3-review threshold so Event#weird_rating (lib/event_module.rb) marks their
  # own sessions red-warning. Everyone else clears the threshold, so the
  # submissions index shows a believable mix instead of being all-red or
  # all-clear. See build_peer_reviews, used by both demo2026 and demo2025.
  SPEAKERS_SHORT_ON_REVIEWS = [19, 20, 21].freeze

  TRACKS = [
    ['Backend',   '4a90d9'],
    ['Frontend',  '7ed321'],
    ['DevOps',    'f5a623'],
    ['Security',  'd0021b'],
    ['Community', '9013fe']
  ].freeze

  def run
    wipe
    ActiveRecord::Base.transaction do
      @crew = build_crew
      @speakers = build_speakers
      @conference = build_main_conference
      attach_crew(@conference)
      build_submissions
      build_reviews
      @academic_events = build_demo2026_academic_sessions
      @reviewer = build_demo2026_reviewer(@academic_events)
      schedule_events
      build_extras
      build_payments
    end
    report
  end

  # DEMO_ACRONYMS still includes 'rubyroom' and 'demo2025' (nothing builds
  # them anymore - see build_demo2026_academic_sessions) purely so wipe keeps
  # cleaning up any leftovers a previous version of this task created.
  def wipe
    Conference.where(acronym: DEMO_ACRONYMS).each(&:destroy)
    emails = CREW.map { |c| c[:email] } + (1..SPEAKERS.size).map { |i| "speaker#{i}@example.org" }
    user_ids = User.where(email: emails).pluck(:id)
    DemoPayment.where(user_id: user_ids).delete_all
    DemoUserAdapter.where(user_id: user_ids).delete_all
    Person.where(email: emails).each(&:destroy)
    User.where(email: emails).each(&:destroy)
  end

  private

  # --- users -------------------------------------------------------------

  def build_crew
    CREW.each_with_object({}) do |spec, acc|
      acc[spec[:role].to_sym] ||= []
      acc[spec[:role].to_sym] << create_user(spec[:email], spec[:name], 'crew')
    end
  end

  def build_speakers
    SPEAKERS.each_with_index.map do |(name, gender), i|
      user = create_user("speaker#{i + 1}@example.org", name, 'submitter', gender)
      # a few speakers get an internal note, so the "people with a note"
      # report and the note box on the person page are not empty
      if [2, 7, 13].include?(i)
        user.person.update!(note: ['Needs a wheelchair accessible room.',
                                   'Invited speaker - travel is paid by us.',
                                   'Asked to not be scheduled before 12:00.'][[2, 7, 13].index(i)])
      end
      user
    end
  end

  def create_user(email, name, role, gender = nil)
    first, last = name.split(' ', 2)
    person = Person.new(
      email: email,
      first_name: first,
      last_name: last,
      public_name: name,
      gender: gender,
      abstract: "#{name} is a demo speaker created by demo:seed.",
      description: "Longer demo biography for #{name}. Works on #{%w(APIs infrastructure design testing).sample} and speaks at conferences.",
      include_in_mailings: true
    )
    user = User.new(
      email: email,
      password: DEMO_PASSWORD,
      password_confirmation: DEMO_PASSWORD
    )
    user.person = person
    user.role = role
    user.gdpr = true
    user.confirmed_at = Time.now
    user.save!
    user
  end

  # --- conferences -------------------------------------------------------

  def build_main_conference
    first_day = Date.today + 21

    conference = Conference.create!(
      acronym: 'demo2026',
      title: 'DemoConf 2026',
      email: 'info@democonf.example.org',
      timezone: 'Berlin',
      timeslot_duration: 15,
      default_timeslots: 4,
      max_timeslots: 16,
      allowed_event_timeslots_csv: '2,4,8',
      allowed_event_types: 'lecture;workshop;lightning_talk;podium;other;Paper Presentation;Special Session;Non-academic Session',
      feedback_enabled: true,
      expenses_enabled: true,
      transport_needs_enabled: true,
      schedule_public: true,
      schedule_open: false,
      bulk_notification_enabled: false,
      event_state_visible: true,
      color: '4a90d9',
      default_recording_license: 'CC BY-SA 4.0',
      schedule_html_intro: '<p>Welcome to the DemoConf 2026 schedule. This data was generated by <code>rails demo:seed</code>.</p>'
    )

    3.times do |i|
      day_start = (first_day + i).in_time_zone(conference.timezone) + 9.hours
      Day.create!(conference: conference, start_date: day_start, end_date: day_start + 11.hours)
    end

    [['Main Hall', 500, 1], ['Room B', 150, 2], ['Workshop Lab', 40, 3], ['Lightning Stage', 80, 4]].each do |name, size, rank|
      Room.create!(conference: conference, name: name, size: size, rank: rank)
    end

    TRACKS.each { |name, color| Track.create!(conference: conference, name: name, color: color) }

    # only codes in I18n.available_locales work here - anything else blows up the
    # translation tabs, because mobility generates no `title_xx` accessor for it
    %w(en de fr).each { |code| Language.create!(code: code, attachable: conference) }

    CallForParticipation.create!(
      conference: conference,
      start_date: Date.today - 30,
      end_date: Date.today + 10,
      hard_deadline: Date.today + 14,
      info_url: 'https://democonf.example.org/cfp',
      contact_email: 'cfp@democonf.example.org',
      welcome_text: "Welcome to the DemoConf 2026 Call for Participation!\n\nSubmit a talk, a workshop or a lightning talk. Everything you see here is demo data."
    )

    [['Content quality', 'Is the topic well prepared and relevant?'],
     ['Speaker experience', 'Has the speaker presented before?'],
     ['Audience fit', 'Does this match our audience?']].each do |name, desc|
      ReviewMetric.create!(conference: conference, name: name, description: desc)
    end

    [['Needs translation', 'Talk requires live translation'],
     ['Streaming ok', 'Speaker agreed to live streaming']].each do |name, desc|
      Classifier.create!(conference: conference, name: name, description: desc)
    end

    create_notifications(conference)
    create_mail_templates(conference)

    conference.reload
  end

  def create_notifications(conference)
    %w(en de).each do |locale|
      Notification.create!(
        conference: conference,
        locale: locale,
        accept_subject: '[%{conference}] Your talk was accepted',
        accept_body: "Hi %{public_name},\n\nwe are happy to accept your submission \"%{event}\" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!",
        reject_subject: '[%{conference}] About your submission',
        reject_body: "Hi %{public_name},\n\nunfortunately we could not fit \"%{event}\" into the program of %{conference}.\n\nThanks for submitting!",
        schedule_subject: '[%{conference}] Your slot in the schedule',
        schedule_body: "Hi %{public_name},\n\n\"%{event}\" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!"
      )
    end
  end

  def create_mail_templates(conference)
    MailTemplate.create!(
      conference: conference,
      name: 'Speaker reminder',
      subject: '[%{conference}] Reminder for %{event}',
      content: "Hi %{public_name},\n\njust a reminder that your talk \"%{event}\" is part of %{conference}.\n\nCheers,\nthe orga team"
    )
    MailTemplate.create!(
      conference: conference,
      name: 'Call for volunteers',
      subject: '[%{conference}] We need helpers',
      content: "Hi %{forename},\n\nwe are still looking for volunteers at %{conference}.\n\nThanks!"
    )
  end

  def attach_crew(conference)
    @crew.each do |role, users|
      users.each { |u| ConferenceUser.create!(conference: conference, user: u, role: role.to_s) }
    end
  end

  # --- submissions -------------------------------------------------------

  SUBMISSIONS_BACKEND = [
    ['Scaling Rails to a million requests',        'What actually breaks first',             'lecture',        4],
    ['Postgres indexes you are not using',         'A practical tour',                       'lecture',        4],
    ['Hexagonal architecture in practice',         'Ports, adapters, regrets',               'lecture',        4],
    ['Why we left microservices',                  'And what we built instead',              'lecture',        4],
    ['Debugging production at 3am',                'War stories',                             'lightning_talk', 2],
    ['Event sourcing without the buzzwords',       'A practical intro',                      'lecture',        4],
    ['Building a plugin system',                   'Extension points done right',            'lecture',        4],
    ['Rate limiting for humans',                    'Fair queues and honest errors',          'lecture',        4],
    ['Caching strategies that survive contact',    'Invalidate this',                        'lecture',        4],
    ['Typed Ruby in a legacy codebase',             'Sorbet, one file at a time',             'lecture',        4],
    ['Background jobs that never lose work',       'Idempotency in practice',                'lecture',        4],
    ['GraphQL at scale',                            'Lessons from three years in production', 'lecture',        4],
    ['The state of Ruby concurrency',              'Fibers, Ractors and threads',            'lecture',        4],
    ['Database migrations without downtime',        'A field guide',                           'workshop',       8],
    ['Building an internal API gateway',            'Why we rolled our own',                  'lecture',        4],
    ['From REST to gRPC',                           'A migration story',                      'lecture',        4],
    ['Feature flags done right',                    'Cleanup is the hard part',               'lecture',        4],
    ['Testing what actually breaks',                'A pragmatic pyramid',                    'workshop',       8],
    ['Static analysis that developers keep',       'Tuning the noise down',                   'lecture',        4],
    ['Multi-tenant architecture patterns',          'One codebase, many customers',           'lecture',        4],
    ['Job queues at scale',                         'Sidekiq, sidekiq everywhere',            'lecture',        4],
    ['Event-driven microservices',                  'Message buses without the mess',         'lecture',        4],
    ['Refactoring without a rewrite',                'One module at a time',                   'workshop',       8],
    ['My favorite Rails anti-patterns',             'And how we fixed them',                  'lightning_talk', 2],
    ['Zero to production in a day',                 'A live-coding session',                  'workshop',       8],
    ['Query plans explained',                       'Reading EXPLAIN without fear',           'lecture',        4],
    ['API versioning strategies',                    'Breaking changes without breaking clients', 'lecture',    4],
    ['Building a plugin ecosystem',                 'What we learned from our extension API', 'lecture',        4],
    ['The cost of abstraction',                      'When DRY goes too far',                  'lightning_talk', 2],
    ['Ask a backend engineer anything',             'Open Q&A',                                'podium',         4]
  ].freeze

  SUBMISSIONS_FRONTEND = [
    ['Building a design system from zero',          'Without a design team',                  'workshop',       8],
    ['CSS layout in 2026',                          'Grid, subgrid and beyond',               'lecture',        4],
    ['Accessibility is not optional',                'Testing with real users',                'lecture',        4],
    ['Progressive enhancement is back',             'Less JavaScript, more product',          'lecture',        4],
    ['Component libraries that survive',             'Versioning and deprecation',             'lecture',        4],
    ['Web performance for content sites',            'Core Web Vitals in practice',            'lecture',        4],
    ['Forms nobody hates',                           'Validation, errors and focus',           'workshop',       8],
    ['Dark mode is an accessibility feature',        'Contrast in both themes',                'lecture',        4],
    ['Offline-first web apps',                       'Sync is the hard part',                  'lecture',        4],
    ['Design tokens in a small team',                'One source of truth',                    'lecture',        4],
    ['State management, do you even need it',       'A minimalist\'s guide',                   'lecture',        4],
    ['Ten JavaScript frameworks in 40 minutes',      'A speedrun',                              'lightning_talk', 2],
    ['Building your own component framework',        'Lessons from the trenches',              'workshop',       8],
    ['A11y audits that developers act on',           'Reports nobody reads',                    'lecture',        4],
    ['Animations that respect motion preferences',   'Delight without nausea',                 'lecture',        4],
    ['The resurgence of server-rendered UI',         'HTML over the wire',                     'lecture',        4],
    ['Web components in production',                 'What actually works today',              'lecture',        4],
    ['Debugging layout shift',                        'A visual investigation',                 'lightning_talk', 2],
    ['Building design systems that scale',           'Tokens, themes and Figma',               'workshop',       8],
    ['Making forms accessible by default',           'A checklist',                             'lecture',        4],
    ['Container queries in practice',                 'Finally, real responsive components',    'lecture',        4],
    ['Frontend testing without the flakiness',        'A survival guide',                       'lecture',        4],
    ['Micro-frontends, one year later',               'Would we do it again?',                  'lecture',        4],
    ['Reducing JavaScript bundle size',               'A case study',                            'lightning_talk', 2],
    ['Typography on the web',                          'Getting the details right',              'lecture',        4],
    ['Building an icon system',                        'SVGs at scale',                          'lecture',        4],
    ['Internationalizing a frontend',                  'RTL, plurals and everything between',    'lecture',        4],
    ['Designing empty states',                          'The screens nobody designs',            'lecture',        4],
    ['CSS without a build step',                        'Native nesting and layers',              'lightning_talk', 2],
    ['Ask a frontend engineer anything',               'Open Q&A',                                'podium',         4]
  ].freeze

  SUBMISSIONS_DEVOPS = [
    ['Kubernetes without tears',                     'An honest retrospective',                'lecture',        4],
    ['Observability on a budget',                     'Logs, metrics, traces',                  'lecture',        4],
    ['Zero downtime migrations',                       'A hands-on workshop',                    'workshop',       8],
    ['Terraform anti-patterns',                        'Modules gone wrong',                     'lightning_talk', 2],
    ['Continuous deployment for teams of one',        'Ship on Friday anyway',                  'lecture',        4],
    ['The art of the postmortem',                      'Blameless, but useful',                  'lecture',        4],
    ['Infrastructure as code reviews',                 'What to look for',                       'lecture',        4],
    ['Backups you have actually restored',            'A checklist',                             'lecture',        4],
    ['On-call without burnout',                         'Rotations that work',                    'lecture',        4],
    ['Cost control in the cloud',                       'Reading the bill',                       'lecture',        4],
    ['Self-hosting your metrics',                       'Prometheus on one box',                  'lecture',        4],
    ['Incident response on a shoestring',              'Two people, one pager',                  'lecture',        4],
    ['GitOps in practice',                               'Deploying from a single source of truth', 'lecture',     4],
    ['Container security basics',                       'What to check before you ship',          'lecture',        4],
    ['Chaos engineering for small teams',               'Breaking things on purpose',             'workshop',       8],
    ['Autoscaling that actually saves money',           'Right-sizing in practice',               'lecture',        4],
    ['Building an internal developer platform',        'Paved roads, not gates',                 'lecture',        4],
    ['Service meshes, do you need one',                 'A sober assessment',                     'lecture',        4],
    ['Runbooks that people actually follow',           'Writing for 3am you',                    'lecture',        4],
    ['Load testing before it hurts',                    'A practical primer',                     'workshop',       8],
    ['Blue-green deployments explained',                'Zero downtime, mostly',                  'lecture',        4],
    ['The hidden cost of YAML',                          'Configuration sprawl',                   'lightning_talk', 2],
    ['Disaster recovery drills',                          'Practicing for the bad day',            'lecture',        4],
    ['Monitoring alert fatigue',                          'Fewer, better alerts',                  'lecture',        4],
    ['Edge computing for regular apps',                  'When it is actually worth it',           'lecture',        4],
    ['Secrets rotation at scale',                          'Automating the boring part',            'lightning_talk', 2],
    ['Building a deploy pipeline from scratch',          'One Friday afternoon',                   'workshop',       8],
    ['SRE practices for small teams',                     'Error budgets without the ceremony',    'lecture',        4],
    ['Migrating off a monolith cluster',                 'A two-year retrospective',               'lecture',        4],
    ['Ask the platform team anything',                    'Open Q&A',                               'podium',         4]
  ].freeze

  SUBMISSIONS_SECURITY = [
    ['Threat modeling for small teams',                 'Start on a whiteboard',                  'lecture',        4],
    ['Supply chain attacks explained',                    'How dependencies bite',                 'lecture',        4],
    ['Secrets management done right',                     'Stop committing .env',                  'lightning_talk', 2],
    ['Hardening a small fleet',                             'Ten changes that matter',              'lecture',        4],
    ['Security reviews for feature teams',                'A lightweight process',                 'lecture',        4],
    ['Rotate your keys',                                     'Three minutes of nagging',             'lightning_talk', 2],
    ['Passkeys in production',                               'Killing the password',                 'lecture',        4],
    ['Privacy engineering basics',                           'GDPR for developers',                  'lecture',        4],
    ['Application security for non-security people',       'A starter kit',                         'workshop',       8],
    ['Dependency scanning that developers trust',          'Fewer false positives',                 'lecture',        4],
    ['Incident response tabletop exercises',               'Practicing before the fire',            'workshop',       8],
    ['Building a bug bounty program',                       'What we learned in year one',          'lecture',        4],
    ['OAuth pitfalls',                                        'Where implementations go wrong',       'lecture',        4],
    ['Zero trust for small companies',                       'Practical steps, not buzzwords',       'lecture',        4],
    ['Auditing third-party libraries',                       'A checklist that scales',              'lecture',        4],
    ['Phishing simulations that teach',                      'Instead of shaming',                   'lecture',        4],
    ['Encrypting data at rest',                               'What actually matters',                'lecture',        4],
    ['Container image scanning',                              'Catching problems before deploy',      'lightning_talk', 2],
    ['Security champions programs',                          'Scaling security without scaling the team', 'lecture', 4],
    ['The economics of ransomware',                          'Why attacks keep working',             'lecture',        4],
    ['Building a secure SDLC',                                'Practical steps for small teams',      'workshop',       8],
    ['API security fundamentals',                             'Beyond the OWASP checklist',           'lecture',        4],
    ['Detecting anomalies without a SOC',                    'What small teams can do',              'lecture',        4],
    ['Post-incident security reviews',                       'Learning without blame',                'lecture',        4],
    ['Hardening CI/CD pipelines',                             'Where the real risk hides',            'lecture',        4],
    ['Multi-factor authentication done right',              'UX without the friction',               'lecture',        4],
    ['Vulnerability disclosure programs',                    'Building trust with researchers',       'lecture',        4],
    ['Security debt',                                          'Naming it, tracking it, paying it down', 'lightning_talk', 2],
    ['Red teaming for beginners',                              'A first exercise',                     'workshop',       8],
    ['Ask a security engineer anything',                     'Open Q&A',                              'podium',         4]
  ].freeze

  SUBMISSIONS_COMMUNITY = [
    ['Running a conference on frab',                          'Lessons from the orga desk',           'lecture',        4],
    ['Growing a local user group',                             'From 5 to 300 people',                 'lecture',        4],
    ['Code of conduct enforcement',                            'The unglamorous work',                 'podium',         4],
    ['My first open source contribution',                     'A beginner story',                     'lightning_talk', 2],
    ['Ask the organizers anything',                            'Open Q&A',                             'podium',         8],
    ['Documentation that people read',                        'Writing for tired humans',              'lecture',        4],
    ['Onboarding new contributors',                            'The first pull request',               'lecture',        4],
    ['Mentoring junior developers',                            'Structure beats good intentions',      'lecture',        4],
    ['Running a code of conduct team',                        'Process, not vibes',                    'lecture',        4],
    ['Sponsorship without selling out',                       'How we fund this',                      'lecture',        4],
    ['Volunteer coordination in practice',                    'Shifts, radios and coffee',             'lecture',        4],
    ['My gem has 12 downloads',                                'And I am proud of it',                 'lightning_talk', 2],
    ['Our first hackathon',                                     'What we would change',                 'lightning_talk', 2],
    ['Scaling our support team',                                'Not a technical talk',                 'lecture',        4],
    ['Building an inclusive CfP process',                      'Beyond a form',                        'lecture',        4],
    ['Burnout in open source maintenance',                    'Naming the problem',                    'lecture',        4],
    ['Running a hybrid conference',                             'What we got wrong',                    'lecture',        4],
    ['Speaker mentoring programs',                              'First talk, less scary',               'workshop',       8],
    ['Community meetup: local user groups',                    'Bring your own agenda',                'other',          4],
    ['Funding open source sustainably',                        'Beyond GitHub Sponsors',                'lecture',        4],
    ['Diversity in tech communities',                           'Ten years of data',                    'lecture',        4],
    ['Writing a conference CfP that works',                    'What reviewers actually read',         'lecture',        4],
    ['Community meetup: newcomer welcome',                    'Bring your questions',                  'other',          4],
    ['From attendee to organizer',                              'A volunteer\'s journey',                'lecture',        4],
    ['Building a Discord that does not die',                  'Moderation and momentum',               'lecture',        4],
    ['Retrospective: five years of this conference',          'What changed',                          'lecture',        4],
    ['Local meetups vs online communities',                    'Do we still need both',                'podium',         4],
    ['Handling difficult CfP rejections',                      'Kindness at scale',                    'lecture',        4],
    ['Swag that people actually keep',                          'A small case study',                   'lightning_talk', 2],
    ['Ask a community organizer anything',                    'Open Q&A',                              'podium',         4]
  ].freeze

  # 5 tracks x 30 talks each = 150 submissions, round-robined (backend #1,
  # frontend #1, devops #1, ... backend #2, ...) so the list - and therefore
  # states, reviewers and submission dates, which are all assigned by index -
  # doesn't cluster everything from one track together
  SUBMISSIONS = [
    ['Backend',   SUBMISSIONS_BACKEND],
    ['Frontend',  SUBMISSIONS_FRONTEND],
    ['DevOps',    SUBMISSIONS_DEVOPS],
    ['Security',  SUBMISSIONS_SECURITY],
    ['Community', SUBMISSIONS_COMMUNITY]
  ].map { |track, talks| talks.map { |title, subtitle, type, slots| [title, subtitle, track, type, slots] } }
   .transpose.flatten(1).freeze

  # state => how many of the 150 submissions above end up in that state
  STATE_PLAN = {
    'confirmed'   => 65,
    'unconfirmed' => 20,
    'review'      => 25,
    'new'         => 20,
    'rejected'    => 10,
    'withdrawn'   => 6,
    'canceled'    => 4
  }.freeze

  def build_submissions
    plan = STATE_PLAN.flat_map { |state, count| [state] * count }
    @events = []

    SUBMISSIONS.each_with_index do |(title, subtitle, track_name, type, slots), i|
      submitter = @speakers[i % @speakers.size]
      event = Event.create!(
        conference: @conference,
        title: title,
        subtitle: subtitle,
        event_type: type,
        time_slots: slots,
        track: @conference.tracks.find_by(name: track_name),
        language: %w(en en en de fr)[i % 5],
        public: true,
        abstract: "#{title}. #{subtitle}. This abstract is demo content generated by demo:seed.",
        description: "A longer description for \"#{title}\".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.",
        submission_note: (i.even? ? 'Prefers a morning slot.' : nil),
        do_not_record: (i % 7 == 0),
        recording_license: @conference.default_recording_license,
        # spread submission dates across the ~29 day CfP window instead of one
        # per day, which would push the earliest entries months into the past
        created_at: Time.now - (1 + (SUBMISSIONS.size - i) * 28 / SUBMISSIONS.size).days
      )
      event.event_people.create!(person: submitter.person, event_role: 'submitter')
      event.event_people.create!(person: submitter.person, event_role: 'speaker', role_state: 'confirmed')

      # every third talk gets a second speaker
      if i % 3 == 2
        co_speaker = @speakers[(i + 5) % @speakers.size]
        event.event_people.create!(person: co_speaker.person, event_role: 'speaker', role_state: 'confirmed')
      end

      Link.create!(linkable: event, title: 'Slides', url: 'https://example.org/slides') if i.even?

      @conference.classifiers.each do |classifier|
        EventClassifier.create!(event: event, classifier: classifier, value: rand(0..2))
      end

      apply_state(event, plan[i])
      @events << event.reload
    end
  end

  # Drives the event through the state machine instead of writing `state`
  # directly, so all the side effects (tokens, coordinator assignment) happen.
  def apply_state(event, target, coordinator = nil)
    coordinator ||= @crew[:coordinator].first.person

    case target
    when 'new'
      # already there
    when 'review'
      event.start_review!
    when 'unconfirmed', 'accepting'
      # which of the two you land in depends on conference.bulk_notification_enabled
      event.start_review!
      event.accept!(send_mail: false, coordinator: coordinator)
    when 'confirmed'
      event.start_review!
      event.accept!(send_mail: false, coordinator: coordinator)
      event.confirm!
    when 'rejected', 'rejecting'
      event.start_review!
      event.reject!(send_mail: false, coordinator: coordinator)
    when 'withdrawn'
      event.start_review!
      event.withdraw!
    when 'canceled'
      event.start_review!
      event.accept!(send_mail: false, coordinator: coordinator)
      event.confirm!
      event.cancel!
    end
  end

  # --- reviews & ratings -------------------------------------------------

  def build_reviews
    reviewers = @crew[:reviewer].map(&:person) + [@crew[:coordinator].first.person]
    metrics = @conference.review_metrics.to_a

    @events.each_with_index do |event, i|
      next if %w(new withdrawn).include?(event.state)

      reviewers.each_with_index do |reviewer, r|
        next if (i + r) % 3 == 0 # leave some gaps so "events I still have to review" is not empty

        rating = EventRating.create!(
          event: event,
          person: reviewer,
          rating: [2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0][(i + r) % 7],
          comment: ['Solid topic, would like to see it.', 'Abstract is a bit thin.', 'Great fit for our audience.', 'We had a similar talk last year.'][(i + r) % 4]
        )
        metrics.each_with_index do |metric, m|
          ReviewScore.create!(event_rating: rating, review_metric: metric, score: ((i + r + m) % 5) + 1)
        end
      end
    end

    build_peer_reviews(@conference, @events)
  end

  # This fork highlights a session row in red until its submitter has finished
  # three peer reviews of other submissions (Event#weird_rating in
  # lib/event_module.rb). Without any peer reviews the whole submissions index
  # is red; without a deliberate, explicit short list it silently turns
  # all-clear the moment SPEAKERS_SHORT_ON_REVIEWS accumulate reviews from
  # another conference (peer review counts are per person, not per
  # conference). So: everyone except the short list gets their three reviews
  # here, which makes most rows plain, a few stay red on purpose, one is
  # forced yellow ("reviewers disagree") and a few are forced green ("fully
  # reviewed"). Shared between demo2026 (build_reviews) and demo2025
  # (build_demo2025_reviews) so both conferences behave the same way.
  def build_peer_reviews(conference, events)
    short_on_reviews = SPEAKERS_SHORT_ON_REVIEWS.map { |idx| @speakers[idx].person }
    reviewable = events.reject { |e| %w(withdrawn canceled).include?(e.state) }
    submitters = events.flat_map { |e| e.event_people.where(event_role: 'submitter').map(&:person) }.uniq

    submitters.each_with_index do |person, i|
      wanted = short_on_reviews.include?(person) ? 1 : 3
      own = person.events.where(conference: conference).pluck(:id)
      candidates = reviewable.reject { |e| own.include?(e.id) }

      candidates.rotate(i * 3).first(wanted).each_with_index do |event, r|
        next if event.event_ratings.exists?(person: person)

        rating = EventRating.create!(
          event: event,
          person: person,
          peer: true,
          rating: [3.0, 3.5, 4.0, 4.5, 5.0][(i + r) % 5],
          comment: ['Peer review: methodology is sound.',
                    'Peer review: solid contribution, accept.',
                    'Peer review: I would like to see this.'][(i + r) % 3]
        )
        conference.review_metrics.each_with_index do |metric, m|
          ReviewScore.create!(event_rating: rating, review_metric: metric, score: ((i + r + m) % 5) + 1)
        end
      end
    end

    force_divergent_review_example(conference, events)
    force_fully_reviewed_examples(conference, short_on_reviews)
  end

  # one 'review' state session gets two wildly disagreeing expert ratings, so
  # the yellow "reviewers disagree" highlight is visible in the index too
  def force_divergent_review_example(conference, events)
    divergent = events.detect { |e| e.state == 'review' }
    return unless divergent

    metrics = conference.review_metrics.to_a
    divergent.event_ratings.where(peer: false).destroy_all
    [[@crew[:reviewer][0].person, 1.0], [@crew[:reviewer][1].person, 5.0]].each do |reviewer, score|
      rating = EventRating.create!(
        event: divergent, person: reviewer, peer: false, rating: score,
        comment: score < 3 ? 'I do not think this fits at all.' : 'I would put this in the main hall.'
      )
      metrics.each { |metric| ReviewScore.create!(event_rating: rating, review_metric: metric, score: score < 3 ? 1 : 5) }
    end
    divergent.recalculate_review_averages!
  end

  # a handful of confirmed sessions get topped up to 2+ peer and 2+ expert
  # ratings of their own, so the green "fully reviewed" highlight shows up
  def force_fully_reviewed_examples(conference, short_on_reviews, count: 4)
    reviewers = @crew[:reviewer].map(&:person) + [@crew[:coordinator].first.person]

    candidates = conference.events.confirmed.select do |event|
      submitter = event.event_people.find_by(event_role: 'submitter')&.person
      submitter && !short_on_reviews.include?(submitter)
    end

    candidates.first(count).each do |event|
      submitter = event.event_people.find_by(event_role: 'submitter').person

      (@speakers.map(&:person) - [submitter] - short_on_reviews).sample(2).each do |peer|
        next if event.event_ratings.exists?(person: peer)
        EventRating.create!(event: event, person: peer, peer: true, rating: 4.0,
                            comment: 'Peer review: solid contribution, accept.')
      end

      reviewers.first(2).each do |reviewer|
        next if event.event_ratings.exists?(person: reviewer)
        EventRating.create!(event: event, person: reviewer, peer: false, rating: 4.0,
                            comment: 'Great fit for our audience.')
      end
    end
  end

  # --- schedule ----------------------------------------------------------

  def schedule_events
    rooms = @conference.rooms.to_a
    days = @conference.days.to_a
    slot_minutes = @conference.timeslot_duration

    # a per-room cursor for each day, so nothing overlaps
    cursors = {}
    days.each { |day| rooms.each { |room| cursors[[day.id, room.id]] = day.start_date } }

    schedulable = @events.select { |e| e.state == 'confirmed' }
    schedulable.each_with_index do |event, i|
      day = days[i % days.size]
      room = rooms[(i / days.size) % rooms.size]
      key = [day.id, room.id]
      start_time = cursors[key]
      duration = event.time_slots * slot_minutes

      next if start_time + duration.minutes > day.end_date

      event.update!(start_time: start_time, room: room)
      cursors[key] = start_time + (duration + 15).minutes
    end

    # speakers need availabilities, otherwise the schedule grid flags conflicts
    @conference.events.confirmed.each do |event|
      event.people.each do |person|
        next if person.availabilities.where(conference: @conference).any?
        person.create_availabilities_for(@conference)
      end
    end

    @conference.update!(schedule_version: '1.0')
  end

  # --- expenses, transport, feedback ------------------------------------

  def build_extras
    @speakers.first(5).each_with_index do |user, i|
      Expense.create!(
        person: user.person,
        conference: @conference,
        name: ['Train ticket', 'Hotel, 2 nights', 'Flight', 'Taxi', 'Dinner'][i],
        value: [45.50, 180.00, 320.00, 22.00, 35.00][i],
        reimbursed: i.even?
      )
      TransportNeed.create!(
        person: user.person,
        conference: @conference,
        at: @conference.days.first.start_date - 2.hours,
        transport_type: %w(train plane car)[i % 3],
        seats: 1,
        booked: i.even?,
        note: 'Arrives the evening before.'
      )
    end
  end

  # --- demo2026 academic sessions (frab-ms review queue) ------------------
  #
  # frab-ms (the sibling review/payment microservice, connected to this same
  # database) only understands the "Paper Presentation", "Special Session"
  # and "Non-academic Session" event types (Paper::ACADEMIC_CONST /
  # PRACTICAL_CONST there - mirrored on this side as Event::ACADEMIC_CONST /
  # PRACTICAL_CONST in lib/event_module.rb). None of the lecture/workshop/
  # lightning_talk/podium/other submissions built above count, so without a
  # batch of these demo2026 has nothing in frab-ms's peer-review queue.
  #
  # This is deliberately kept out of @events / build_reviews above: the
  # generic build_peer_reviews call assigns peer reviews to every submitter
  # across the whole conference, which would make the pending-review count
  # for build_demo2026_reviewer below incidental instead of guaranteed.
  # Review assignment for this batch is handled explicitly here instead.
  DEMO2026_PAPERS = [
    ['Formal verification of consensus protocols at scale',                   'Paper Presentation'],
    ['Post-quantum migration: a systematic review of TLS deployments',        'Paper Presentation'],
    ['Measuring flakiness: a year of CI data from 200 repositories',          'Paper Presentation'],
    ['Special session: sustaining open source maintainers',                   'Special Session'],
    ['Special session: accessibility regressions in modern JS frameworks',   'Special Session'],
    ['Industry track: zero-downtime database migrations at scale',           'Non-academic Session'],
    ['Cold start latency in serverless runtimes: a comparative study',       'Paper Presentation'],
    ['Industry track: incident response lessons from a supply-chain breach', 'Non-academic Session']
  ].freeze

  def build_demo2026_academic_sessions
    track = @conference.tracks.first

    events = DEMO2026_PAPERS.each_with_index.map do |(title, type), i|
      submitter = @speakers[i]

      event = Event.create!(
        conference: @conference,
        title: title,
        subtitle: type,
        event_type: type,
        time_slots: @conference.default_timeslots, # overwritten by the fork's after_create hook
        track: track,
        language: 'en',
        public: true,
        abstract: "#{title}. Demo abstract for an academic submission generated by demo:seed.",
        description: "Full paper description for \"#{title}\".\n\nBackground, method and results - demo content for frab-ms's review flow.",
        recording_license: @conference.default_recording_license
      )
      event.event_people.create!(person: submitter.person, event_role: 'submitter')
      event.event_people.create!(person: submitter.person, event_role: 'speaker', role_state: 'confirmed')
      event.start_review!
      event.reload
    end

    # Two papers get one partial peer review each, so the queue shows a
    # believable mix of untouched and partially-reviewed papers - both stay
    # well under the 3-review threshold that would otherwise close them out.
    metrics = @conference.review_metrics.to_a
    [[0, 8], [2, 9]].each do |paper_index, speaker_index|
      rating = EventRating.create!(
        event: events[paper_index], person: @speakers[speaker_index].person, peer: true,
        rating: 8.0,
        comment: 'Peer review: solid methodology, would like more detail on the evaluation.'
      )
      metrics.each { |metric| ReviewScore.create!(event_rating: rating, review_metric: metric, score: 4) }
      events[paper_index].recalculate_review_averages!
    end

    events
  end

  # A speaker with genuine, guaranteed pending review work. They submit 2
  # papers rather than 1 on purpose: frab-ms's User#get_related_papers caps a
  # reviewer's queue at (their own submitted papers in the conference) * 3 -
  # a single submission would cap the queue at 3 and undercut "sees at least
  # 5 papers to review". With 2 submissions (cap 6), no peer reviews of their
  # own, and no overlap with the DEMO2026_PAPERS submitters above, all 8 of
  # those papers are open to them - the queue fills to the cap of 6.
  DEMO2026_REVIEWER_PAPERS = [
    ['Reproducible benchmarking harness for distributed systems papers', 'Paper Presentation'],
    ['Special session: writing program-committee reviews that authors can act on', 'Special Session']
  ].freeze

  def build_demo2026_reviewer(academic_events)
    reviewer = @speakers[10] # speaker11@example.org - not a submitter in DEMO2026_PAPERS above
    track = @conference.tracks.first

    DEMO2026_REVIEWER_PAPERS.each do |title, type|
      event = Event.create!(
        conference: @conference,
        title: title,
        subtitle: type,
        event_type: type,
        time_slots: @conference.default_timeslots,
        track: track,
        language: 'en',
        public: true,
        abstract: "#{title}. Demo abstract for an academic submission generated by demo:seed.",
        description: "Full paper description for \"#{title}\".\n\nDemo content for frab-ms's review flow.",
        recording_license: @conference.default_recording_license
      )
      event.event_people.create!(person: reviewer.person, event_role: 'submitter')
      event.event_people.create!(person: reviewer.person, event_role: 'speaker', role_state: 'confirmed')
      event.start_review!
    end

    reviewer
  end

  # --- payments (frab-ms) --------------------------------------------------
  #
  # `payments` and `user_adapters` are tables owned by frab-ms, not this app
  # (there is no Payment/UserAdapter model here) - these are plain
  # ActiveRecord classes pointed at the same physical tables in the shared
  # database, so demo:seed can leave a realistic mix of paid/unpaid
  # solidarity-fee state without depending on frab-ms's codebase.
  class DemoPayment < ActiveRecord::Base
    self.table_name = 'payments'
  end

  class DemoUserAdapter < ActiveRecord::Base
    self.table_name = 'user_adapters'
  end

  def build_payments
    plan = {
      'speaker1@example.org'  => { country: 'HR',  request_date: 5.days.ago,  solidarity_fee: false, paid: true },
      'speaker2@example.org'  => { country: 'DE',  request_date: 2.days.ago,  solidarity_fee: false, paid: false },
      'speaker3@example.org'  => { country: 'KSO', request_date: 10.days.ago, solidarity_fee: true,  paid: true },
      'speaker4@example.org'  => { country: 'ES',  request_date: nil,        solidarity_fee: false, paid: false },
      'speaker5@example.org'  => { country: 'FR',  request_date: 1.day.ago,   solidarity_fee: false, paid: false },
      'speaker6@example.org'  => { country: 'IT',  request_date: 20.days.ago, solidarity_fee: false, paid: true },
      'orga@example.org'      => { country: 'HR',  request_date: nil,        solidarity_fee: false, paid: true },
      'reviewer@example.org'  => { country: 'HR',  request_date: 3.days.ago,  solidarity_fee: false, paid: false },
      'speaker11@example.org' => { country: 'NL',  request_date: 6.days.ago,  solidarity_fee: false, paid: true }
    }

    plan.each do |email, attrs|
      user = User.find_by(email: email)
      next unless user

      payment = DemoPayment.find_or_initialize_by(user_id: user.id)
      payment.update!(country: attrs[:country], request_date: attrs[:request_date], solidarity_fee: attrs[:solidarity_fee])

      adapter = DemoUserAdapter.find_or_initialize_by(user_id: user.id)
      adapter.update!(paid: attrs[:paid])
    end
  end

  # --- devroom (sub-conference) -----------------------------------------

  def build_devroom
    devroom = Conference.create!(
      acronym: 'rubyroom',
      title: 'Ruby Devroom @ DemoConf 2026',
      parent: @conference,
      email: 'ruby@democonf.example.org',
      default_timeslots: 2,
      max_timeslots: 8,
      allowed_event_timeslots_csv: '2,4',
      allowed_event_types: 'lecture;lightning_talk',
      schedule_public: true,
      bulk_notification_enabled: true, # so accept/reject queue up instead of mailing at once
      feedback_enabled: true,
      color: 'd0021b'
    )

    Room.create!(conference: devroom, name: 'Ruby Room', size: 60, rank: 1)
    Track.create!(conference: devroom, name: 'Ruby', color: 'd0021b')
    %w(en).each { |code| Language.create!(code: code, attachable: devroom) }
    devroom.reload
    create_notifications(devroom)

    CallForParticipation.create!(
      conference: devroom,
      start_date: Date.today - 20,
      end_date: Date.today + 10,
      welcome_text: 'The Ruby devroom is looking for short talks.'
    )

    ConferenceUser.create!(conference: devroom, user: @crew[:orga].first, role: 'orga')
    ConferenceUser.create!(conference: devroom, user: @crew[:reviewer].first, role: 'reviewer')

    coordinator = @crew[:coordinator].first.person
    [['Ruby 4 in production',      'accepting'],
     ['Rewriting Sidekiq jobs',    'accepting'],
     ['Hanami vs Rails',           'rejecting'],
     ['Fibers for the impatient',  'review'],
     ['My gem has 12 downloads',   'new']].each_with_index do |(title, target), i|
      speaker = @speakers[i]
      event = Event.create!(
        conference: devroom,
        title: title,
        subtitle: 'Ruby devroom talk',
        event_type: 'lecture',
        time_slots: 2,
        track: devroom.tracks.first,
        language: 'en',
        public: true,
        abstract: "#{title}. Demo submission for the Ruby devroom.",
        description: "Demo description for \"#{title}\"."
      )
      event.event_people.create!(person: speaker.person, event_role: 'submitter')
      event.event_people.create!(person: speaker.person, event_role: 'speaker', role_state: 'confirmed')

      case target
      when 'review'  then event.start_review!
      when 'accepting'
        event.start_review!
        event.accept!(send_mail: false, coordinator: coordinator)
      when 'rejecting'
        event.start_review!
        event.reject!(send_mail: false, coordinator: coordinator)
      end
    end

    devroom
  end

  # --- demo2025: the fully populated reference conference ----------------
  #
  # This is the conference the client manual is written against. It is
  # deliberately the richest data set in this file: every event state, review
  # metrics with real scores, availabilities (complete, partial and missing),
  # expenses, transport needs, attachments, feedback and mail templates. Its
  # three days straddle "today", so time sensitive screens (the "who is on
  # stage in the next hours" reports, the schedule grid's current-time marker)
  # actually show something.

  DEMO2025_TRACKS = [
    ['Keynotes',    '111111'],
    ['Backend',     '4a90d9'],
    ['Frontend',    '7ed321'],
    ['DevOps',      'f5a623'],
    ['Security',    'd0021b'],
    ['Data & AI',   '9013fe'],
    ['Community',   '50e3c2']
  ].freeze

  DEMO2025_ROOMS = [
    ['Main Hall',       400, 1],
    ['Room B',          120, 2],
    ['Workshop Lab',     40, 3],
    ['Lightning Stage',  80, 4]
  ].freeze

  # title, subtitle, track, type, slots, state, options
  #
  # The options exist to make the report screens meaningful - each of them
  # switches on at least one entry in Reports -> "Query events"/"Query speakers".
  DEMO2025_SESSIONS = [
    ['Opening keynote: ten years of frab', 'What we learned running conferences', 'Keynotes', 'lecture', 4, 'confirmed', { speakers: 1, tech_rider: 'Wireless handheld microphone, HDMI, clicker.' }],
    ['Refactoring legacy Rails', 'A field guide', 'Backend', 'lecture', 4, 'confirmed', { speakers: 2 }],
    ['From monolith to modules', 'Without a big bang rewrite', 'Backend', 'lecture', 4, 'confirmed', { speakers: 1, submission_note: 'Prefers a morning slot.' }],
    ['Postgres query plans explained', 'Reading EXPLAIN without fear', 'Backend', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Background jobs that never lose work', 'Idempotency in practice', 'Backend', 'lecture', 4, 'confirmed', { speakers: 1, do_not_record: true }],
    ['Continuous deployment for teams of one', 'Ship on Friday anyway', 'DevOps', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['The art of the postmortem', 'Blameless, but useful', 'DevOps', 'lecture', 4, 'confirmed', { speakers: 2, note: 'Coordinate with the SRE track next year.' }],
    ['Zero downtime database migrations', 'Hands-on workshop', 'DevOps', 'workshop', 8, 'confirmed', { speakers: 1, tech_rider: 'Power strips for 20 laptops, whiteboard.' }],
    ['Threat modeling for small teams', 'Start on a whiteboard', 'Security', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Supply chain attacks explained', 'How your dependencies bite', 'Security', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Designing for accessibility', 'Testing with real users', 'Frontend', 'lecture', 4, 'confirmed', { speakers: 2 }],
    ['CSS layout, the calm parts', 'Grid, subgrid and container queries', 'Frontend', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Documentation that people read', 'Writing for tired humans', 'Community', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Onboarding new contributors', 'The first pull request', 'Community', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Vector databases without the hype', 'What they are actually good at', 'Data & AI', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Evaluating LLM output', 'Metrics you can defend', 'Data & AI', 'lecture', 4, 'confirmed', { speakers: 2 }],
    ['Lightning: my gem has 12 downloads', 'And I am proud of it', 'Community', 'lightning_talk', 2, 'confirmed', { speakers: 1 }],
    ['Lightning: stop committing .env', 'Secrets management in five minutes', 'Security', 'lightning_talk', 2, 'confirmed', { speakers: 1 }],
    ['Lightning: Terraform anti-patterns', 'Modules gone wrong', 'DevOps', 'lightning_talk', 2, 'confirmed', { speakers: 1 }],
    ['Closing panel: the next ten years', 'Open discussion', 'Keynotes', 'podium', 8, 'confirmed', { speakers: 3, tech_rider: 'Four lapel microphones, four bar stools.' }],
    ['Community meetup: local user groups', 'Bring your own agenda', 'Community', 'meeting', 4, 'confirmed', { speakers: 1, public: false }],

    ['Event sourcing, one year later', 'Would we do it again?', 'Backend', 'lecture', 4, 'unconfirmed', { speakers: 1 }],
    ['Feature flags at scale', 'Cleaning up is the hard part', 'DevOps', 'lecture', 4, 'unconfirmed', { speakers: 1 }],
    ['Fine-tuning on a laptop', 'Small models, real results', 'Data & AI', 'workshop', 8, 'unconfirmed', { speakers: 1, submission_note: 'Can only attend on the last day.' }],
    ['Passkeys in production', 'Killing the password', 'Security', 'lecture', 4, 'unconfirmed', { speakers: 2, role_state: 'unclear' }],

    ['WebAssembly for backend developers', 'A tour without the buzzwords', 'Backend', 'lecture', 4, 'review', { speakers: 1 }],
    ['Design tokens in a small team', 'One source of truth', 'Frontend', 'lecture', 4, 'review', { speakers: 1, subtitle_blank: true }],
    ['Incident response on a shoestring', 'Two people, one pager', 'DevOps', 'lecture', 4, 'review', { speakers: 1 }],
    ['Privacy engineering basics', 'GDPR for developers', 'Security', 'lecture', 6, 'review', { speakers: 1 }],
    ['Teaching kids to code', 'Lessons from a school club', 'Community', 'lecture', 4, 'review', { speakers: 1, abstract_blank: true }],

    ['Rewriting our search stack', 'Elastic, Postgres, or neither', 'Backend', 'lecture', 4, 'new', { speakers: 1 }],
    ['A11y audits that developers act on', 'Reports nobody reads', 'Frontend', 'lecture', 4, 'new', { speakers: 1 }],
    ['Self-hosting your metrics', 'Prometheus on one box', 'DevOps', 'lecture', 4, 'new', { speakers: 0 }],
    ['Open data for city budgets', 'Scraping, cleaning, publishing', 'Data & AI', 'lecture', 4, 'new', { speakers: 1, submission_note: 'First time speaker, would appreciate mentoring.' }],

    ['Why our startup failed', 'A cautionary tale', 'Community', 'lecture', 4, 'rejected', { speakers: 1 }],
    ['Blockchain for conference tickets', 'A proposal', 'Backend', 'lecture', 4, 'rejected', { speakers: 1, note: 'Off topic for this edition.' }],
    ['Ten JavaScript frameworks in 40 minutes', 'A speedrun', 'Frontend', 'lecture', 4, 'rejected', { speakers: 1 }],

    ['Migrating 200 microservices', 'A long story', 'Backend', 'lecture', 8, 'withdrawn', { speakers: 1 }],
    ['Kubernetes operators from scratch', 'Writing your own controller', 'DevOps', 'workshop', 8, 'withdrawn', { speakers: 1, note: 'Speaker changed employer.' }],

    ['Sponsor session: observability tooling', 'Vendor showcase', 'Data & AI', 'other', 4, 'canceled', { speakers: 1, note: 'Sponsor pulled out two weeks before the event.' }],

    # second half of the programme - mostly accepted sessions, so the schedule
    # grid actually looks like a conference instead of a mostly empty table
    ['Day 2 keynote: software we can maintain', 'A talk about restraint', 'Keynotes', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Day 3 keynote: the people problem', 'Teams beat tools', 'Keynotes', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Caching strategies that survive contact', 'Invalidate this', 'Backend', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Typed Ruby in a legacy codebase', 'Sorbet, one file at a time', 'Backend', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Rate limiting for humans', 'Fair queues and honest errors', 'Backend', 'lecture', 4, 'confirmed', { speakers: 2 }],
    ['Testing what actually breaks', 'A pragmatic pyramid', 'Backend', 'workshop', 8, 'confirmed', { speakers: 1 }],
    ['Progressive enhancement is back', 'Less JavaScript, more product', 'Frontend', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Component libraries that survive', 'Versioning and deprecation', 'Frontend', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Web performance for content sites', 'Core Web Vitals in practice', 'Frontend', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Forms nobody hates', 'Validation, errors and focus', 'Frontend', 'workshop', 8, 'confirmed', { speakers: 1 }],
    ['Infrastructure as code reviews', 'What to look for', 'DevOps', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Backups you have actually restored', 'A checklist', 'DevOps', 'lecture', 4, 'confirmed', { speakers: 1, tech_rider: 'Terminal font must be readable from the back row.' }],
    ['On-call without burnout', 'Rotations that work', 'DevOps', 'lecture', 4, 'confirmed', { speakers: 2 }],
    ['Hardening a small fleet', 'Ten changes that matter', 'Security', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Security reviews for feature teams', 'A lightweight process', 'Security', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Lightning: rotate your keys', 'Three minutes of nagging', 'Security', 'lightning_talk', 2, 'confirmed', { speakers: 1 }],
    ['Cleaning messy public data', 'Pandas, but carefully', 'Data & AI', 'workshop', 8, 'confirmed', { speakers: 1 }],
    ['Recommendations without creepiness', 'Useful and boring', 'Data & AI', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Running a code of conduct team', 'Process, not vibes', 'Community', 'lecture', 4, 'confirmed', { speakers: 2 }],
    ['Sponsorship without selling out', 'How we fund this', 'Community', 'lecture', 4, 'confirmed', { speakers: 1 }],
    ['Lightning: our first hackathon', 'What we would change', 'Community', 'lightning_talk', 2, 'confirmed', { speakers: 1 }],
    ['Volunteer coordination in practice', 'Shifts, radios and coffee', 'Community', 'meeting', 4, 'confirmed', { speakers: 1 }],
    ['Ask the schedule team anything', 'Open session', 'Community', 'podium', 4, 'confirmed', { speakers: 3 }],

    ['Building a plugin system', 'Extension points done right', 'Backend', 'lecture', 4, 'unconfirmed', { speakers: 1 }],
    ['Offline-first web apps', 'Sync is the hard part', 'Frontend', 'lecture', 4, 'unconfirmed', { speakers: 1 }],
    ['Cost control in the cloud', 'Reading the bill', 'DevOps', 'lecture', 4, 'unconfirmed', { speakers: 1, submission_note: 'Would prefer the second day.' }],

    ['Static analysis that developers keep', 'Tuning the noise down', 'Backend', 'lecture', 4, 'review', { speakers: 1 }],
    ['Dark mode is an accessibility feature', 'Contrast in both themes', 'Frontend', 'lecture', 4, 'review', { speakers: 1 }],
    ['Running Postgres yourself', 'When managed is not an option', 'DevOps', 'lecture', 4, 'review', { speakers: 1 }],

    ['A grammar of graphics for the web', 'Charts without a framework', 'Data & AI', 'lecture', 4, 'new', { speakers: 1 }],
    ['Mentoring junior developers', 'Structure beats good intentions', 'Community', 'lecture', 4, 'new', { speakers: 1 }],

    ['Our new JavaScript framework', 'You will love it', 'Frontend', 'lecture', 4, 'rejected', { speakers: 1 }],
    ['AI will replace conferences', 'A provocation', 'Data & AI', 'podium', 4, 'rejected', { speakers: 1, note: 'Programme committee voted this down unanimously.' }],

    ['Scaling our support team', 'Not a technical talk', 'Community', 'lecture', 4, 'withdrawn', { speakers: 1 }]
  ].freeze

  def build_demo2025
    conference = create_demo2025_conference
    @past = conference
    coordinator = @crew[:coordinator].first.person

    events = DEMO2025_SESSIONS.each_with_index.map do |(title, subtitle, track, type, slots, state, opts), i|
      build_demo2025_session(conference, title, subtitle, track, type, slots, state, opts || {}, i, coordinator)
    end

    build_demo2025_reviews(conference, events)
    academic = build_demo2025_academic_sessions(conference, coordinator)
    events += academic
    schedule_demo2025(conference, events)
    # extras runs first: it flips some speakers to "attending", and the
    # availability step wants the final role states to pick its two speakers
    # that never answered
    build_demo2025_extras(conference)
    build_demo2025_availabilities(conference)
    build_demo2025_feedback(events)
    promote_some_to_scheduled(conference)
    build_demo2025_history(conference)

    # The "events without abstract/subtitle" reports look for an empty string,
    # but abstract is validated as present and mobility turns an assigned ''
    # into NULL. Both are therefore written straight to the column at the very
    # end, after every state transition and average recalculation has run.
    DEMO2025_SESSIONS.each_with_index do |row, i|
      opts = row[6]
      next unless opts.is_a?(Hash)
      events[i].update_column(:abstract, '') if opts[:abstract_blank]
      events[i].update_column(:subtitle, '') if opts[:subtitle_blank]
    end

    conference.reload
  end

  def create_demo2025_conference
    conference = Conference.create!(
      acronym: 'demo2025',
      title: 'DemoConf 2025',
      email: 'info@democonf.example.org',
      timezone: 'Berlin',
      timeslot_duration: 15,
      default_timeslots: 4,
      max_timeslots: 16,
      allowed_event_timeslots_csv: '2,4,6,8,12',
      # the last three types are the ones this fork treats specially: reviewers
      # only ever see "Paper Presentation" and "Special Session", and the three
      # "Accepted ..." reports look for exactly these strings
      allowed_event_types: 'lecture;workshop;lightning_talk;podium;meeting;other;Paper Presentation;Special Session;Non-academic Session',
      feedback_enabled: true,
      expenses_enabled: true,
      transport_needs_enabled: true,
      schedule_public: true,
      schedule_open: false,
      bulk_notification_enabled: false,
      event_state_visible: true,
      attachment_title_is_freeform: false,
      color: '7ed321',
      default_recording_license: 'CC BY-SA 4.0',
      schedule_version: '1.4',
      bcc_address: 'archive@democonf.example.org',
      schedule_html_intro: '<p>Welcome to the DemoConf 2025 schedule. All of this is demo data generated by <code>rails demo:seed</code>.</p>'
    )

    # yesterday, today, tomorrow - so that "starts in the next hours" reports
    # and the schedule grid have something to show
    first_day = Date.today - 1
    3.times do |i|
      day_start = (first_day + i).in_time_zone(conference.timezone) + 9.hours
      Day.create!(conference: conference, start_date: day_start, end_date: day_start + 6.hours)
    end

    DEMO2025_ROOMS.each { |name, size, rank| Room.create!(conference: conference, name: name, size: size, rank: rank) }
    DEMO2025_TRACKS.each { |name, color| Track.create!(conference: conference, name: name, color: color) }
    %w(en de fr).each { |code| Language.create!(code: code, attachable: conference) }

    conference.reload # associations above were cached as empty during validation

    CallForParticipation.create!(
      conference: conference,
      start_date: Date.today - 60,
      end_date: Date.today + 14,
      hard_deadline: Date.today + 21,
      info_url: 'https://democonf.example.org/cfp',
      contact_email: 'cfp@democonf.example.org',
      welcome_text: "Welcome to the DemoConf 2025 Call for Participation!\n\nWe are looking for lectures, workshops and lightning talks. Tell us what you want to talk about, how long you need and when you are available - the rest is up to the review team.\n\nEverything you see here is demo data."
    )

    [['Content quality',    'Is the topic well prepared, correct and relevant?'],
     ['Speaker experience', 'Has the speaker presented before, and how well?'],
     ['Audience fit',       'Does this match the audience we expect?'],
     ['Originality',        'Have we (or another conference) seen this talk already?']].each do |name, desc|
      ReviewMetric.create!(conference: conference, name: name, description: desc)
    end

    [['Needs translation', 'Talk requires live translation'],
     ['Streaming ok',      'Speaker agreed to live streaming'],
     ['Beginner friendly', 'No prior knowledge required']].each do |name, desc|
      Classifier.create!(conference: conference, name: name, description: desc)
    end

    create_notifications(conference)
    create_mail_templates(conference)
    create_demo2025_mail_templates(conference)

    @crew.each do |role, users|
      users.each { |u| ConferenceUser.create!(conference: conference, user: u, role: role.to_s) }
    end

    conference.reload
  end

  def create_demo2025_mail_templates(conference)
    [
      ['Confirm your talk',
       '[%{conference}] Please confirm "%{event}"',
       "Hi %{public_name},\n\nyour submission \"%{event}\" (%{type}, %{duration}) was accepted for %{conference}.\n\nPlease confirm that you will be there:\n%{link}\n\nIf you cannot make it, just tell us - no hard feelings.\n\nThe %{conference} programme team"],
      ['Schedule announcement',
       '[%{conference}] Your slot: %{date} %{time}',
       "Hi %{public_name},\n\nthe schedule is public. \"%{event}\" is on %{date} at %{time} in %{room}.\n\nPlease be at the room 15 minutes early so the video team can wire you up.\n\nSee you soon!"],
      ['Technical check reminder',
       '[%{conference}] Tech check for "%{event}"',
       "Hi %{forename},\n\nplease come to %{room} on %{date} at least 30 minutes before %{time} for a short technical check (audio, video, your laptop).\n\nIf you need an adapter, tell us now and we will bring one.\n\nThe %{conference} tech team"],
      ['Slides and recording',
       '[%{conference}] Slides for "%{event}"',
       "Hi %{public_name},\n\nthank you for your talk at %{conference}!\n\nCould you upload your slides to your submission (%{event_id}) so we can publish them together with the recording?\n\nThank you,\nthe %{conference} team"],
      ['Invite a co-speaker',
       '[%{conference}] Join "%{event}" as co-speaker',
       "Hi,\n\n%{public_name} would like you to join the session \"%{event}\" at %{conference} as a co-speaker.\n\nUse this link to join:\n%{joinlink}\n\nThe %{conference} team"]
    ].each do |name, subject, content|
      MailTemplate.create!(conference: conference, name: name, subject: subject, content: content)
    end
  end

  def build_demo2025_session(conference, title, subtitle, track_name, type, slots, target_state, opts, i, coordinator)
    submitter = @speakers[i % @speakers.size]

    event = Event.create!(
      conference: conference,
      title: title,
      subtitle: opts[:subtitle_blank] ? '' : subtitle,
      event_type: type,
      time_slots: slots,
      track: conference.tracks.find_by(name: track_name),
      language: %w(en en en en de fr)[i % 6],
      public: opts.fetch(:public, true),
      abstract: "#{title}. #{subtitle}. This abstract is demo content generated by demo:seed.",
      description: "A longer description for \"#{title}\".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.",
      note: opts[:note],
      submission_note: opts[:submission_note],
      tech_rider: opts[:tech_rider],
      do_not_record: opts.fetch(:do_not_record, false),
      recording_license: conference.default_recording_license,
      created_at: Time.now - (DEMO2025_SESSIONS.size - i + 30).days
    )

    event.event_people.create!(person: submitter.person, event_role: 'submitter')

    speaker_count = opts.fetch(:speakers, 1)
    speaker_count.times do |s|
      person = @speakers[(i + s * 7) % @speakers.size].person
      next if event.event_people.exists?(person: person, event_role: 'speaker')
      role_state = if s.zero? && opts[:role_state]
                     opts[:role_state]
                   elsif %w(confirmed unconfirmed).include?(target_state)
                     'confirmed'
                   else
                     'offer'
                   end
      event.event_people.create!(person: person, event_role: 'speaker', role_state: role_state)
    end

    Link.create!(linkable: event, title: 'Slides', url: 'https://example.org/slides') if i % 3 == 0
    Link.create!(linkable: event, title: 'Project homepage', url: 'https://example.org/project') if i % 5 == 0

    conference.classifiers.each_with_index do |classifier, c|
      EventClassifier.create!(event: event, classifier: classifier, value: (i + c) % 3)
    end

    attach_demo_file(event, i)
    apply_state(event, target_state, coordinator)
    event.reload
  end

  # A real (tiny) upload, so the "Attachments" tab and the CfP upload form show
  # something instead of an empty list.
  def attach_demo_file(event, i)
    return unless i % 4 == 0
    title = EventAttachment::ATTACHMENT_TITLES[i % EventAttachment::ATTACHMENT_TITLES.size]
    path = Rails.root.join('tmp', "demo_#{title}.txt")
    File.write(path, "Demo #{title} for \"#{event.title}\".\n\nGenerated by rails demo:seed.\n")
    EventAttachment.create!(event: event, title: title, public: true, attachment: File.open(path))
  ensure
    File.delete(path) if path && File.exist?(path)
  end

  # --- demo2025 reviews --------------------------------------------------

  def build_demo2025_reviews(conference, events)
    reviewers = @crew[:reviewer].map(&:person) + [@crew[:coordinator].first.person, @crew[:orga].first.person]
    metrics = conference.review_metrics.to_a

    comments = [
      'Solid topic, well written abstract. I would like to see this.',
      'The abstract is a bit thin - I would ask for more detail before accepting.',
      'Great fit for our audience, and the speaker is experienced.',
      'We had a very similar talk last year. Maybe as a lightning talk?',
      'Interesting, but it overlaps with another submission in the same track.',
      'Strong yes from me. This is exactly the kind of session people ask for.'
    ]

    events.each_with_index do |event, i|
      # brand new submissions stay unreviewed on purpose, so the reviewer's
      # "events I still have to review" list is not empty
      next if event.state == 'new'

      reviewers.each_with_index do |reviewer, r|
        next if (i + r) % 4 == 0 # leave gaps

        rating = EventRating.create!(
          event: event,
          person: reviewer,
          rating: [2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0][(i + r) % 7],
          comment: comments[(i + r) % comments.size]
        )
        metrics.each_with_index do |metric, m|
          ReviewScore.create!(event_rating: rating, review_metric: metric, score: ((i + r + m) % 5) + 1)
        end
      end

      event.recalculate_review_averages!
    end

    # peer reviews, the red/yellow/green submission-index highlight and its
    # short-on-reviews list are shared with demo2026 - see build_peer_reviews
    build_peer_reviews(conference, events)
  end

  # --- demo2025 academic sessions ----------------------------------------
  #
  # This fork carries an academic conference workflow on top of frab:
  #
  #   * a reviewer's session list only contains "Paper Presentation" and
  #     "Special Session" entries (lib/event_module.rb),
  #   * a session disappears from that list once somebody filed an expert
  #     (non-peer) review, unless the reviewer already reviewed it themselves,
  #   * submissions carry up to five coauthors,
  #   * the reports "Accepted Special Sessions", "Accepted Paper Presentations"
  #     and "Accepted Non-academic Sessions" look for the state `accepting`.
  #
  # Without sessions of these types the whole reviewer interface and three of
  # the reports are empty, so demo2025 gets a batch of them.

  # title, type, state, expert reviewed?
  DEMO2025_PAPERS = [
    ['Reproducibility in empirical software engineering', 'Paper Presentation',    'accepting', true],
    ['A longitudinal study of code review latency',       'Paper Presentation',    'accepting', true],
    ['Measuring onboarding cost in open source projects', 'Paper Presentation',    'accepting', false],
    ['Energy consumption of container workloads',         'Paper Presentation',    'accepting', false],
    ['Static analysis adoption: a survey of 40 teams',    'Paper Presentation',    'review',    false],
    ['Technical debt and defect density revisited',       'Paper Presentation',    'review',    false],
    ['Teaching distributed systems with simulations',     'Paper Presentation',    'new',       false],
    ['Special session: open data in public administration', 'Special Session',     'accepting', true],
    ['Special session: research software engineering',    'Special Session',       'accepting', false],
    ['Special session: replication studies',              'Special Session',       'review',    false],
    ['Special session: metrics that mislead',             'Special Session',       'rejecting', true],
    ['Industry track: migrating a national registry',     'Non-academic Session',  'accepting', true],
    ['Industry track: accessibility in public services',  'Non-academic Session',  'accepting', false]
  ].freeze

  COAUTHOR_NAMES = [
    %w(Elena Sokolova), %w(Diego Fernandez), %w(Amara Okafor),
    %w(Jonas Lindqvist), %w(Priya Raman), %w(Mehmet Yilmaz)
  ].freeze

  def build_demo2025_academic_sessions(conference, coordinator)
    # the accepting/rejecting states only exist while bulk notification is on
    conference.update!(bulk_notification_enabled: true)

    reviewers = @crew[:reviewer].map(&:person)
    metrics = conference.review_metrics.to_a
    short_on_reviews = SPEAKERS_SHORT_ON_REVIEWS.map { |idx| @speakers[idx].person }

    events = DEMO2025_PAPERS.each_with_index.map do |(title, type, state, expert_reviewed), i|
      submitter = @speakers[(i * 3) % @speakers.size]
      co = COAUTHOR_NAMES[i % COAUTHOR_NAMES.size]

      event = Event.create!(
        conference: conference,
        title: title,
        subtitle: type,
        event_type: type,
        time_slots: conference.default_timeslots, # overwritten by the fork's after_create hook
        track: conference.tracks.find_by(name: 'Data & AI') || conference.tracks.first,
        language: 'en',
        public: true,
        abstract: "#{title}. Demo abstract for an academic submission generated by demo:seed.",
        description: "Full paper description for \"#{title}\".\n\nBackground, method, results and threats to validity - all of it demo content.",
        recording_license: conference.default_recording_license,
        coauthor_1: "coauthor#{i + 1}@example.org",
        coauthor_1_name: co[0],
        coauthor_1_last_name: co[1],
        created_at: Time.now - (40 - i).days
      )

      event.event_people.create!(person: submitter.person, event_role: 'submitter')
      event.event_people.create!(person: submitter.person, event_role: 'speaker', role_state: 'confirmed')

      # peer reviews - written by other submitters, as the academic workflow expects.
      # short_on_reviews speakers are skipped here too, otherwise this loop
      # quietly tops them up past the 3-review threshold that keeps their own
      # sessions flagged red-warning (see SPEAKERS_SHORT_ON_REVIEWS)
      3.times do |p|
        peer = @speakers[(i + p * 4 + 1) % @speakers.size].person
        next if peer == submitter.person || short_on_reviews.include?(peer) || event.event_ratings.exists?(person: peer)

        rating = EventRating.create!(event: event, person: peer, peer: true,
                                     rating: [3.0, 3.5, 4.0, 4.5, 5.0][(i + p) % 5],
                                     comment: 'Peer review: the method is described well enough to replicate.')
        metrics.each_with_index { |m, k| ReviewScore.create!(event_rating: rating, review_metric: m, score: ((i + p + k) % 5) + 1) }
      end

      # expert reviews - by the conference reviewers. A session that already has
      # one drops out of the other reviewers' queue, so only some sessions get it.
      if expert_reviewed
        reviewer = reviewers[i % reviewers.size]
        rating = EventRating.create!(event: event, person: reviewer, peer: false,
                                     rating: [3.5, 4.0, 4.5, 5.0][i % 4],
                                     comment: 'Expert review: solid contribution, accept for the programme.')
        metrics.each_with_index { |m, k| ReviewScore.create!(event_rating: rating, review_metric: m, score: ((i + k) % 5) + 1) }
      end

      event.recalculate_review_averages!
      apply_state(event, state, coordinator)
      event.reload
    end

    conference.update!(bulk_notification_enabled: false)
    events
  end

  # --- demo2025 schedule -------------------------------------------------

  def schedule_demo2025(conference, events)
    rooms = conference.rooms.to_a
    days = conference.days.to_a
    slot_minutes = conference.timeslot_duration

    # leave the last three accepted sessions unscheduled, so the schedule grid
    # has something in the "unscheduled sessions" box to drag around
    queue = events.select { |e| e.state == 'confirmed' }[0...-3].to_a
    # spread the programme evenly instead of packing the first day full
    per_day = (queue.size.to_f / days.size).ceil

    days.each do |day|
      cursors = rooms.each_with_object({}) { |room, acc| acc[room.id] = day_cursor_start(conference, day) }
      placed = 0

      until queue.empty? || placed == per_day
        event = queue.first
        duration = event.time_slots * slot_minutes

        # fill the emptiest room of the day first, and only rooms where the
        # session still fits before the day ends
        room_id = cursors.keys
                         .select { |id| cursors[id] + duration.minutes <= day.end_date }
                         .min_by { |id| [cursors[id], id] }
        break if room_id.nil? # this day is full, move on to the next one

        event.update!(start_time: cursors[room_id], room: rooms.detect { |r| r.id == room_id })
        cursors[room_id] += (duration + 15).minutes
        placed += 1
        queue.shift
      end
    end
  end

  # The middle day of demo2025 is "today". Starting its programme two hours
  # before the current time keeps the running conference around "now": the
  # schedule grid shows the current-time marker between sessions, and the
  # reports that ask "who is on stage within the next hours" return rows.
  def day_cursor_start(conference, day)
    return day.start_date unless day.start_date.to_date == Date.today

    now = Time.now.in_time_zone(conference.timezone)
    candidate = (now - 2.hours).change(min: (now.min / 15) * 15, sec: 0)
    latest = day.end_date - 5.hours
    [[candidate, day.start_date].max, latest].min
  end

  # Availabilities on purpose come in three flavours: full, partial, and
  # missing - the last one drives the "speakers without availabilities" report.
  def build_demo2025_availabilities(conference)
    days = conference.days.to_a
    people = conference.events.flat_map(&:speakers).uniq

    people.each_with_index do |person, i|
      days.each_with_index do |day, d|
        # most speakers are there the whole time; a minority is restricted, so
        # the schedule grid shows a handful of orange "speaker not available"
        # warnings instead of being either all green or all orange
        case i % 6
        when 1 # arrives late, not there for the first session of the day
          start_at, end_at = day.start_date + 1.hour, day.end_date
        when 3 # has to leave before the last session of the day
          start_at, end_at = day.start_date, day.end_date - 1.hour
        when 5 # not available on the last day at all
          next if d == days.size - 1
          start_at, end_at = day.start_date, day.end_date
        else   # available for the whole conference
          start_at, end_at = day.start_date, day.end_date
        end

        Availability.create!(person: person, conference: conference, day: day,
                             start_date: start_at, end_date: end_at)
      end
    end

    # Two confirmed speakers never filled the form in - that is what the
    # "speakers without availabilities" report is for. The report does not
    # scope availabilities by conference, so these two have to be free of
    # availabilities everywhere; picking from the end of the speaker list
    # keeps them out of demo2026.
    forgetful = Person.joins(events: :conference)
                      .where('conferences.id': conference.id)
                      .where('event_people.event_role': EventPerson::SPEAKERS)
                      .where('event_people.role_state': %w(confirmed scheduled))
                      .distinct.order(id: :desc).limit(2).to_a
    Availability.where(person: forgetful).destroy_all
  end

  # --- demo2025 expenses, transport, attendance --------------------------

  def build_demo2025_extras(conference)
    speakers = conference.events.confirmed.flat_map(&:speakers).uniq

    expense_rows = [
      ['Train ticket, return',     78.40],
      ['Hotel, 2 nights',         210.00],
      ['Flight',                  340.00],
      ['Taxi from the airport',    28.50],
      ['Speaker dinner',           45.00],
      ['Conference visa fee',      80.00],
      ['Train ticket',             52.10]
    ]

    speakers.each_with_index do |person, i|
      next if i % 3 == 2

      name, value = expense_rows[i % expense_rows.size]
      Expense.create!(person: person, conference: conference, name: name,
                      value: value, reimbursed: i.even?)

      TransportNeed.create!(
        person: person,
        conference: conference,
        at: conference.days.first.start_date - (i % 5).hours,
        transport_type: %w(train plane car bus)[i % 4],
        seats: 1,
        booked: i % 3 == 0,
        note: ['Arrives the evening before.', 'Needs a pickup at the station.', nil][i % 3]
      )
    end

    # mark part of the speakers as having checked in at the info desk
    conference.events.confirmed.each_with_index do |event, i|
      next unless i.even?
      event.event_people.where(event_role: 'speaker').each do |ep|
        ep.update!(role_state: 'attending')
      end
    end
  end

  def build_demo2025_feedback(events)
    comments = [
      'Really useful, thanks!', 'A bit too fast for me.', 'Best talk of the day.',
      'Good content, the room was too small.', nil,
      'I would have liked more live demos.', 'Great speaker, clear slides.'
    ]

    events.select { |e| e.start_time.present? && e.start_time < Time.now }.each_with_index do |event, i|
      (4 + (i % 5)).times do |f|
        EventFeedback.create!(
          event: event,
          rating: [3.0, 4.0, 5.0, 4.5, 2.5, 5.0, 4.0][(i + f) % 7],
          comment: comments[(i + f) % comments.size]
        )
      end
    end
  end

  # Everything above is seeded with paper_trail switched off, which leaves the
  # dashboard's "Recent changes" box and the session history tab empty. A few
  # tracked edits at the end fill both with something to look at.
  def build_demo2025_history(conference)
    PaperTrail.enabled = true

    editors = [@crew[:orga].first, @crew[:coordinator].first, @crew[:reviewer].first]

    edits = [
      -> { conference.events.confirmed.first&.update(note: 'Confirmed by phone, speaker will bring their own laptop.') },
      -> { conference.events.confirmed.second&.update(do_not_record: true) },
      -> { conference.tracks.find_by(name: 'Community')&.update(color: '50e3c2') },
      -> { conference.rooms.find_by(name: 'Workshop Lab')&.update(size: 45) },
      -> { conference.events.where(state: 'review').first&.update(submission_note: 'Asked the speaker for a longer abstract.') },
      -> { conference.events.where(state: 'unconfirmed').first&.update(note: 'Reminder sent, waiting for confirmation.') },
      -> { conference.rooms.find_by(name: 'Lightning Stage')&.update(rank: 4) },
      -> { conference.events.confirmed.third&.update(tech_rider: 'Needs a second screen for the notes view.') }
    ]

    edits.each_with_index do |edit, i|
      user = editors[i % editors.size]
      PaperTrail.request(whodunnit: user.id.to_s,
                         controller_info: { conference_id: conference.id }) do
        edit.call
      end
    end
  ensure
    PaperTrail.enabled = false
  end

  # A handful of sessions get pushed all the way to "scheduled" (the state
  # after the schedule notification went out). That transition only exists
  # while bulk notification is on, so we flip the flag around it.
  def promote_some_to_scheduled(conference)
    conference.update!(bulk_notification_enabled: true)
    conference.events.where(state: 'confirmed').scheduled.limit(6).each do |event|
      event.notify! if event.transition_possible?(:notify) && event.notifiable
    end
  ensure
    conference.update!(bulk_notification_enabled: false)
  end

  # --- output ------------------------------------------------------------

  def report
    puts
    puts '=' * 72
    puts 'Demo data created.'
    puts '=' * 72
    puts
    puts "Conferences:"
    puts format('  %-12s %-32s %s', @conference.acronym, @conference.title, "#{@conference.events.count} events")
    puts
    puts "Login (password for everyone: #{DEMO_PASSWORD})"
    puts '  admin@example.org        global admin'
    CREW.each { |c| puts format('  %-24s %s of demo2026', c[:email], c[:role]) }
    puts format('  speaker1@example.org     submitter (CfP view), speaker1..speaker%d', SPEAKERS.size)
    puts
    puts "Events per state in #{@conference.acronym}:"
    @conference.events.group(:state).count.sort.each { |state, count| puts format('  %-14s %d', state, count) }
    puts
    puts 'frab-ms review queue (Paper Presentation / Special Session / Non-academic Session):'
    puts format('  %d academic sessions submitted by speaker1..speaker%d', @academic_events.size, DEMO2026_PAPERS.size)
    puts format('  %s submitted %d more and has no reviews of their own on the batch above -',
                @reviewer.email, DEMO2026_REVIEWER_PAPERS.size)
    puts '  their frab-ms review queue for demo2026 is guaranteed to show at least 5 papers.'
    puts
    puts 'Try:'
    puts '  http://localhost:3000/demo2026                   open CfP, crew / management'
    puts '  http://localhost:3000/demo2026/public/schedule   public schedule + feedback'
    puts '  http://localhost:3000/demo2026/cfp               submitter view'
    puts
  end
end
