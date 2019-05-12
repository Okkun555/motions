class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :training_day, null: false
      t.text :training_title, null: false
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
