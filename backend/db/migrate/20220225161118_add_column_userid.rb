class AddColumnUserid < ActiveRecord::Migration[6.0]
  def up
    add_column :habitations, :user_id, :integer
  end

  def down
    remove_column :habitations, :user_id, :integer
  end
end
