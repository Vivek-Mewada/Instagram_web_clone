class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.text :bio
      t.integer :phone_number
      t.datetime :dob
      t.string :gender 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
