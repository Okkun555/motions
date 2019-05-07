class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :training_day, null: false
      t.text :training_menu, null: false #トレーニングの内容
      t.string :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
