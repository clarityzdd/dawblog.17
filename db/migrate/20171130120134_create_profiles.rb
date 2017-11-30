class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.date :birthday
      t.text :bio
      t.string :color

      t.timestamps
    end
  end
end
