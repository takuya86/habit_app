class CreateHabitations < ActiveRecord::Migration[6.0]
  def change
    create_table :habitations do |t|
      t.string :min_target, default: "", null: false
      t.string :max_target, default: "", null: false
      t.integer :period, null: false, default: 0
      t.text :thoughts

      t.timestamps
    end
  end
end
