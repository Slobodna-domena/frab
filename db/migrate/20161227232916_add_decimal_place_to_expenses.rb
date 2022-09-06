class AddDecimalPlaceToExpenses < ActiveRecord::Migration[5.1]
  def change
    change_column :expenses, :value, :decimal, precision: 7, scale: 2
  end
end
