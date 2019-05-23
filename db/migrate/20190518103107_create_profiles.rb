class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.text :user_profile
      t.boolean :gim_training
      t.boolean :house_training
      t.boolean :weight_training
      t.boolean :bodyweight_training
      t.boolean :diet
      t.boolean :body_make
      t.boolean :power

      t.timestamps
    end
  end
end
