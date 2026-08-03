namespace :demo do
  DEMO_ACRONYMS = %w(demo2026 rubyroom demo2025).freeze
  DEMO_PASSWORD = 'test123'.freeze

  desc 'build a complete, clickable demo setup (conferences, crew, speakers, submissions in every state)'
  task seed: :environment do
    abort 'demo:seed refuses to run in production' if Rails.env.production?

    PaperTrail.enabled = false
    ActionMailer::Base.delivery_method = :test

    DemoSeed.new.run
  end

  desc 'remove everything demo:seed created'
  task clean: :environment do
    abort 'demo:clean refuses to run in production' if Rails.env.production?
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
      schedule_events
      build_extras
      @devroom = build_devroom
      @past = build_demo2025
    end
    report
  end

  def wipe
    Conference.where(acronym: DEMO_ACRONYMS).each(&:destroy)
    emails = CREW.map { |c| c[:email] } + (1..SPEAKERS.size).map { |i| "speaker#{i}@example.org" }
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
      allowed_event_types: 'lecture;workshop;lightning_talk;podium;other',
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

  SUBMISSIONS = [
    ['Scaling Rails to a million requests',        'What actually breaks first', 'Backend',   'lecture',        4],
    ['Postgres indexes you are not using',         'A practical tour',           'Backend',   'lecture',        4],
    ['Hexagonal architecture in practice',         'Ports, adapters, regrets',   'Backend',   'lecture',        4],
    ['Building a design system from zero',         'Without a design team',      'Frontend',  'workshop',       8],
    ['CSS layout in 2026',                         'Grid, subgrid and beyond',   'Frontend',  'lecture',        4],
    ['Kubernetes without tears',                   'An honest retrospective',    'DevOps',    'lecture',        4],
    ['Observability on a budget',                  'Logs, metrics, traces',      'DevOps',    'lecture',        4],
    ['Zero downtime migrations',                   'A hands-on workshop',        'DevOps',    'workshop',       8],
    ['Threat modeling for small teams',            'Start on a whiteboard',      'Security',  'lecture',        4],
    ['Supply chain attacks explained',             'How dependencies bite',      'Security',  'lecture',        4],
    ['Secrets management done right',              'Stop committing .env',       'Security',  'lightning_talk', 2],
    ['Running a conference on frab',               'Lessons from the orga desk', 'Community', 'lecture',        4],
    ['Growing a local user group',                 'From 5 to 300 people',       'Community', 'lecture',        4],
    ['Code of conduct enforcement',                'The unglamorous work',       'Community', 'podium',         4],
    ['My first open source contribution',          'A beginner story',           'Community', 'lightning_talk', 2],
    ['Debugging production at 3am',                'War stories',                'Backend',   'lightning_talk', 2],
    ['Why we left microservices',                  'And what we built instead',  'Backend',   'lecture',        4],
    ['Accessibility is not optional',              'Testing with real users',    'Frontend',  'lecture',        4],
    ['Terraform anti-patterns',                    'Modules gone wrong',         'DevOps',    'lightning_talk', 2],
    ['Ask the organizers anything',                'Open Q&A',                   'Community', 'podium',         8]
  ].freeze

  # state => how many of the submissions above end up in that state
  STATE_PLAN = {
    'confirmed'   => 9,
    'unconfirmed' => 3,
    'review'      => 3,
    'new'         => 2,
    'rejected'    => 1,
    'withdrawn'   => 1,
    'canceled'    => 1
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
        created_at: Time.now - (SUBMISSIONS.size - i).days
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

    build_demo2025_peer_reviews(conference, events)
  end

  # This fork highlights a session row in red until its submitter has finished
  # three peer reviews (Event#weird_rating in lib/event_module.rb). Without
  # peer reviews the whole session list is red, which is not what the demo
  # should look like - so most submitters get their three reviews here, and a
  # few are left short on purpose so the highlight is still visible.
  def build_demo2025_peer_reviews(conference, events)
    submitters = conference.events.flat_map { |e| e.event_people.where(event_role: 'submitter').map(&:person) }.uniq
    reviewable = events.reject { |e| %w(withdrawn canceled).include?(e.state) }

    submitters.each_with_index do |person, i|
      wanted = i >= submitters.size - 3 ? 1 : 3 # last three stay flagged
      own = person.events.pluck(:id)
      candidates = reviewable.reject { |e| own.include?(e.id) }
      candidates.rotate(i * 3).first(wanted).each_with_index do |event, r|
        next if event.event_ratings.exists?(person: person)

        EventRating.create!(
          event: event,
          person: person,
          peer: true,
          rating: [3.0, 3.5, 4.0, 4.5, 5.0][(i + r) % 5],
          comment: ['Peer review: methodology is sound.',
                    'Peer review: the argument holds, minor wording issues.',
                    'Peer review: solid contribution, accept.'][(i + r) % 3]
        )
      end
    end

    # one session gets a deliberately divergent set of ratings, so the yellow
    # "reviewers disagree" highlight shows up in the list as well
    divergent = events.detect { |e| e.state == 'review' }
    return unless divergent

    metrics = conference.review_metrics.to_a
    divergent.event_ratings.destroy_all
    [[@crew[:reviewer][0].person, 1.0, 1], [@crew[:reviewer][1].person, 5.0, 5]].each do |reviewer, score, metric_score|
      rating = EventRating.create!(
        event: divergent, person: reviewer, rating: score,
        comment: score < 3 ? 'I do not think this fits at all.' : 'I would put this in the main hall.'
      )
      metrics.each { |metric| ReviewScore.create!(event_rating: rating, review_metric: metric, score: metric_score) }
    end
    divergent.recalculate_review_averages!
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

      # peer reviews - written by other submitters, as the academic workflow expects
      3.times do |p|
        peer = @speakers[(i + p * 4 + 1) % @speakers.size].person
        next if peer == submitter.person || event.event_ratings.exists?(person: peer)

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
    [@conference, @devroom, @past].each do |c|
      puts format('  %-12s %-32s %s', c.acronym, c.title, "#{c.events.count} events")
    end
    puts
    puts "Login (password for everyone: #{DEMO_PASSWORD})"
    puts '  admin@example.org        global admin'
    CREW.each { |c| puts format('  %-24s %s of demo2025 and demo2026', c[:email], c[:role]) }
    puts format('  speaker1@example.org     submitter (CfP view), speaker1..speaker%d', SPEAKERS.size)
    puts
    [@conference, @past].each do |c|
      puts "Events per state in #{c.acronym}:"
      c.events.group(:state).count.sort.each { |state, count| puts format('  %-14s %d', state, count) }
      puts
    end
    puts format('demo2025: %d review ratings, %d availabilities, %d feedbacks, %d mail templates',
                EventRating.joins(:event).where(events: { conference_id: @past.id }).count,
                @past.availabilities.count,
                EventFeedback.joins(:event).where(events: { conference_id: @past.id }).count,
                @past.mail_templates.count)
    puts
    puts 'Try:'
    puts '  http://localhost:3000/demo2025                   crew / management (the manual is written against this one)'
    puts '  http://localhost:3000/demo2025/public/schedule   public schedule + feedback'
    puts '  http://localhost:3000/demo2025/cfp               submitter view'
    puts '  http://localhost:3000/demo2026                   second conference, open CfP'
    puts '  http://localhost:3000/rubyroom                   devroom with queued (bulk) notifications'
    puts
  end
end
