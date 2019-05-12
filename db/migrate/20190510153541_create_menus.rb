class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :training_event, null: false
      t.integer :training_weight
      t.integer :reps
      t.integer :training_time
      t.integer :distance
      t.integer :log_id

      t.timestamps
    end
  end
end
