module PersonModule
  def own_papers(conf)
    self.events.where(conference_id: conf.id).select{|event| !event.event_people.where(person_id: self.id).where(event_role: "submitter").blank? }
  end

  def coauthored_papers(conf)
    self.events.where(conference_id: conf.id)
      .select{|event| !event.event_people.where(person_id: self.id).where(event_role: "speaker").blank? && event.event_people.where(person_id: self.id).where(event_role: "submitter").blank?}
  end
end
