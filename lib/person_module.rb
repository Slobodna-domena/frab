module PersonModule
  def own_papers(conf)
    self.events.where(conference_id: conf.id).select{|event| !event.event_people.where(person_id: self.id).where(event_role: "submitter").blank? }
  end

  def coauthored_papers(conf)
    self.events.where(conference_id: conf.id)
      .select{|event| !event.event_people.where(person_id: self.id).where(event_role: "speaker").blank? && event.event_people.where(person_id: self.id).where(event_role: "submitter").blank?}
  end

  def has_paid?
    user = self.user
    return nil if user.nil?
    sql = "select paid from user_adapters where user_id=#{user.id}"
    results = ActiveRecord::Base.connection.exec_query(sql)
    if results.present? && results[0]
      return results[0]["paid"] == true
    else
      return nil
    end
  end
end
