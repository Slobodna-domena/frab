require 'test_helper'

class EventPersonTest < ActiveSupport::TestCase
  test "confirmation advances both person's and event's state if possible" do
    event = create(:event, state: 'unconfirmed')
    person = create(:person)
    event_person = create(:event_person, event: event, person: person, role_state: 'offer')
    event_person.confirm!
    assert_equal 'confirmed', event_person.role_state
    assert_equal 'confirmed', event.state
  end

  test 'confirmation token gets generated' do
    event_person = create(:event_person)
    assert_nil event_person.confirmation_token
    event_person.generate_token!
    assert_not_nil event_person.confirmation_token
  end

  test 'checks for availability correctly' do
    today = Date.today
    conference = create(:three_day_conference)
    event = create(:event, conference: conference)
    person = create(:person)
    create(:availability, conference: conference, person: person, start_date: Time.parse('10:00'), end_date: Time.parse('14:00'))
    event_person = create(:event_person, event: event, person: person)
    assert event_person.available_between?(today.to_time.change(hour: 11), today.to_time.change(hour: 13))
    assert event_person.available_between?(today.to_time.change(hour: 10), today.to_time.change(hour: 14))
    assert !event_person.available_between?(today.to_time.change(hour: 9), today.to_time.change(hour: 11))
    assert !event_person.available_between?(today.to_time.change(hour: 0), today.to_time.change(hour: 11))
    assert !event_person.available_between?(today.to_time.change(hour: 13), today.to_time.change(hour: 24))
  end

  test 'check involved_in returns correct number of people' do
    conference = create(:three_day_conference)
    event = create(:event, conference: conference, state: 'confirmed')
    person1 = create(:person)
    person2 = create(:person)
    create(:confirmed_event_person, event: event, person: person1)
    create(:confirmed_event_person, event: event, person: person2)
    persons = Person.involved_in(conference)
    assert_equal 2, persons.count
    assert_includes persons, person1

    create(:event_person, event: event, person: person1, event_role: 'coordinator', role_state: 'confirmed')
    assert_equal 2, Person.involved_in(conference).count

    event2 = create(:event, conference: conference, state: 'confirmed')
    create(:confirmed_event_person, event: event2, person: person2)
    assert_equal 2, Person.involved_in(conference).count
  end

  test 'check speaking_at returns conferences speakers' do
    conference = create(:three_day_conference_with_events)
    event = conference.events.first
    create(:confirmed_event_person, event: event)
    assert_equal 1, Person.speaking_at(conference).count
    person2 = create(:person)
    create(:event_person, event: event, person: person2, event_role: 'coordinator', role_state: 'confirmed')
    assert_equal 1, Person.speaking_at(conference).count
  end

  test 'test notification and substitution' do
    conference = create(:three_day_conference_with_events)
    event = conference.events.first
    event.room = conference.rooms.first

    event_person = create(:confirmed_event_person, event: event)
    assert_raise do
      event_person.set_default_notification 'reject'
    end
    create(:notification, conference: conference, locale: 'en')
    assert_raise do
      event_person.substitute_notification_variables 'unknownstate', :body
    end

    event_person.substitute_notification_variables 'accept', :subject
    event_person.set_default_notification 'accept'

    assert_not_equal event_person.substitute_notification_variables('accept', :subject), conference.rooms.first.name
    event_person.notification_subject = '%{room}'
    assert_equal event_person.substitute_notification_variables('accept', :subject), conference.rooms.first.name

    assert_nil event_person.notification_subject
  end
end
