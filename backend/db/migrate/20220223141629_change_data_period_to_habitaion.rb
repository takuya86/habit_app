class ChangeDataPeriodToHabitaion < ActiveRecord::Migration[6.0]
  def up
    remove_column :habitations, :period
  end

  def down
    add_column :habitations, :period, :integer
  end
end
