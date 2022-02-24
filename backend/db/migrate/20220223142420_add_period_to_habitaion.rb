class AddPeriodToHabitaion < ActiveRecord::Migration[6.0]
  def change
    add_column :habitations, :period, :date
  end
end
