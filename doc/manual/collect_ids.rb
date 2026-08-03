# Collects the record ids the screenshot script needs, so that
# capture_screenshots.rb can address detail pages directly.
#
#   bundle exec rails runner doc/manual/collect_ids.rb
#
# Writes doc/manual/ids.json.
require 'json'

conference = Conference.find_by!(acronym: 'demo2025')

# a scheduled session with two speakers, ratings and feedback - the richest
# "show" page we can point the manual at
event = conference.events.scheduled.with_more_than_one_speaker.first ||
        conference.events.scheduled.first

# a session the demo reviewer has already scored, so the review form shows a
# filled in set of review metrics instead of a row of "N/A"
reviewer_person = User.find_by(email: 'reviewer@example.org')&.person
review_event = conference.events
                         .where(event_type: Event::ACADEMIC_CONST)
                         .where(state: %w(review accepting unconfirmed))
                         .joins(:event_ratings)
                         .where(event_ratings: { person_id: reviewer_person&.id })
                         .where('EXISTS (SELECT 1 FROM review_scores WHERE review_scores.event_rating_id = event_ratings.id)')
                         .first
review_event ||= conference.events.where(state: %w(review new)).first
person = event.speakers.first
speaker_with_expenses = Expense.where(conference: conference).first&.person || person
template = conference.mail_templates.find_by(name: 'Confirm your talk') || conference.mail_templates.first
today = conference.days.detect { |d| d.start_date.to_date == Date.today } || conference.days.first

data = {
  'conference' => conference.acronym,
  'event_id' => event.id,
  'event_title' => event.title,
  'review_event_id' => review_event&.id,
  'review_event_title' => review_event&.title,
  'person_id' => person.id,
  'person_name' => person.public_name,
  'expenses_person_id' => speaker_with_expenses.id,
  'mail_template_id' => template.id,
  'mail_template_name' => template.name,
  'day_index' => conference.days.index(today) + 1,
  'speaker_email' => person.email,
  'submitter_email' => conference.events.where(state: 'new').first&.event_people&.find_by(event_role: 'submitter')&.person&.email
}

path = Rails.root.join('doc', 'manual', 'ids.json')
File.write(path, JSON.pretty_generate(data))
puts "wrote #{path}"
puts JSON.pretty_generate(data)
