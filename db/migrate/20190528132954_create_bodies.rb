class CreateBodies < ActiveRecord::Migration[5.2]
  def change
    create_table :bodies do |t|
      t.date :date, null: false
      t.float :length
      t.float :weight
      t.float :fat_percentage
      t.integer :user_id

      t.timestamps
    end
  end
end
