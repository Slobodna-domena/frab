class SendBulkMailJob
  include SuckerPunch::Job

  def perform(template, destination)
    if destination.kind_of? String
      event_people = EventPerson
        .joins(event: :conference)
        .where('conferences.id': template.conference.id)

      case destination
      when 'all_speakers_in_confirmed_events'
        event_people = event_people
          .where('events.state': 'confirmed')
          .where('event_people.event_role': EventPerson::SUBSCRIBERS)

      when 'all_speakers_in_unconfirmed_events'
        event_people = event_people
          .where('events.state': 'unconfirmed')
          .where('event_people.event_role': EventPerson::SUBSCRIBERS)

      when 'all_speakers_in_scheduled_events'
        event_people = event_people
          .where('events.state': 'scheduled')
          .where('event_people.event_role': EventPerson::SUBSCRIBERS)
      else
        raise "unsupported destination #{destination}"
      end
      destination_event_people = event_people
    else
      destination_event_people = destination
    end
    
    ep_ids = [376,4,7,318,43,9,13,32,10,11,12,14,15,16,17,18,19,20,21,22,24,25,26,27,28,29,30,31,33,34,35,36,37,42,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76]
    destination_event_people = destination_event_people.where.not("event_id not in (?) and event_role <> 'submitter'", ep_ids)
    destination_event_people.each do |dep|
      UserMailer.bulk_mail_multiple_roles(dep, template).deliver_now
      p=Person.find(dep.person_id)
      Rails.logger.info "Mail template #{template.name} delivered to #{p.first_name} #{p.last_name} (#{p.email})"
    end
  end
end
