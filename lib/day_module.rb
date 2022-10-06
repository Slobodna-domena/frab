Day.class_eval do
  after_create do |resource|
    resource.conference.events.each do |e|
      e.people.each do |p|
        p.availabilities.destroy_all
        Availability.build_for(resource.conference).each do |a|
          a.person_id = p.id
          a.save!
        end
      end
    end
  end
end

module DayModule
end
