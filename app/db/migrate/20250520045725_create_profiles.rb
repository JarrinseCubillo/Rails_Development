class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :city
      t.string :country
      t.boolean :gender
      t.date :birth
      t.integer :role
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
