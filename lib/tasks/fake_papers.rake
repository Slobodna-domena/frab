# frozen_string_literal: true

# Adds random submissions ("papers") to a conference for testing the peer
# review flow (frab-ms) and the expert review (events/ratings).
#
#   bundle exec rake frab:add_fake_papers
#   bundle exec rake frab:add_fake_papers COUNT=20 CONFERENCE=tcon PASSWORD=test123
#
# Each paper gets its own new, confirmed submitter user (login: the printed
# email, password PASSWORD, default test123), so you can log into peer review
# as that author. Safe to run repeatedly: emails get a unique random suffix.
namespace :frab do
  desc 'add random papers to the newest conference for peer review testing (COUNT=10 CONFERENCE=acronym PASSWORD=test123)'
  task add_fake_papers: :environment do
    require 'faker'

    count = (ENV['COUNT'] || 10).to_i
    password = ENV['PASSWORD'] || 'test123'
    conference = if ENV['CONFERENCE'].present?
                   Conference.find_by!(acronym: ENV['CONFERENCE'])
                 else
                   Conference.order(:created_at).last
                 end
    abort 'No conference found.' unless conference

    # frab-ms only offers these event types for peer review; anything else is invisible there.
    review_types = Event::ACADEMIC_CONST + Event::PRACTICAL_CONST
    types = conference.allowed_event_types_as_list & review_types
    types = review_types if types.empty?

    ActiveRecord::Base.transaction do
      if conference.classifiers.empty?
        5.times do
          conference.classifiers.create!(name: Faker::Hacker.unique.noun.capitalize)
        end
        puts "Conference had no keywords, created: #{conference.classifiers.pluck(:name).join(', ')}"
      end
      classifiers = conference.classifiers.to_a
      tracks = conference.tracks.to_a
      languages = conference.languages.pluck(:code).presence || ['en']

      count.times do
        first = Faker::Name.first_name
        last = Faker::Name.last_name
        email = "#{first}.#{last}.#{SecureRandom.hex(3)}@example.org".downcase.gsub(/[^a-z0-9.@]/, '')

        user = User.new(email: email, password: password, password_confirmation: password, gdpr: true)
        user.person = Person.new(email: email, first_name: first, last_name: last, public_name: "#{first} #{last}")
        user.skip_confirmation!
        user.save!

        coauthor_attrs = {}
        rand(0..2).times do |i|
          n = i + 1
          cf = Faker::Name.first_name
          cl = Faker::Name.last_name
          coauthor_attrs["coauthor_#{n}"] = "#{cf}.#{cl}.#{SecureRandom.hex(3)}@example.org".downcase.gsub(/[^a-z0-9.@]/, '')
          coauthor_attrs["coauthor_#{n}_name"] = cf
          coauthor_attrs["coauthor_#{n}_last_name"] = cl
        end

        event = Event.new(
          coauthor_attrs.merge(
            conference: conference,
            event_type: types.sample,
            state: 'new',
            title: Faker::Book.unique.title,
            subtitle: Faker::Hacker.say_something_smart.chomp('!'),
            abstract: Faker::Lorem.paragraphs(number: rand(2..4)).join("\n\n"),
            description: Faker::Lorem.paragraphs(number: rand(3..6)).join("\n\n"),
            submission_note: [nil, Faker::Lorem.sentence].sample,
            time_slots: 3,
            track: tracks.sample,
            language: languages.sample,
            recording_license: conference.default_recording_license
          )
        )
        event.event_people << EventPerson.new(person: user.person, event_role: 'submitter')
        event.event_people << EventPerson.new(person: user.person, event_role: 'speaker')

        # 1-3 random keywords with weights summing to 100 %
        picked = classifiers.sample(rand(1..[3, classifiers.size].min))
        cuts = (1..99).to_a.sample(picked.size - 1).sort
        weights = ([0] + cuts + [100]).each_cons(2).map { |a, b| b - a }
        picked.zip(weights).each do |classifier, value|
          event.event_classifiers.build(classifier: classifier, value: value)
        end

        event.save!
        puts "##{event.id} [#{event.event_type}] #{event.title} | keywords: " \
             "#{event.event_classifiers.map { |ec| "#{ec.classifier.name} #{ec.value}%" }.join(', ')} | submitter: #{email}"
      end
    end

    puts "Added #{count} papers to #{conference.title} (#{conference.acronym}). Submitter password: #{password}"
  end
end
