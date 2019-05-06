class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :today, null: false
      t.text :training, null: false
      t.string :memo
      t.float :weight
      t.integer :user_id

      t.timestamps
    end
  end
end
