class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :location
      t.string :gender
      t.integer :age
      t.text :about

      t.timestamps null: false
    end
  end
end
