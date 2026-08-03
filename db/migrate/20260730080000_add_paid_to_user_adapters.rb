class AddPaidToUserAdapters < ActiveRecord::Migration[6.1]
  # Person#has_paid? (lib/person_module.rb) reads user_adapters.paid, but the
  # column was never added, so every view calling Event#weird_rating - the
  # event lists in particular - raised "no such column: paid".
  def change
    add_column :user_adapters, :paid, :boolean, default: false
  end
end
