class FillPublicName < ActiveRecord::Migration[5.1]
  def up
    Person.reset_column_information
    Person.all.each do |person|
      if person.public_name.blank?
        person.update_attribute :public_name, person.full_name
      end
    end
  end

  def down
  end
end
