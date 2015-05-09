class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :continent
      t.string :country
      t.string :city
      t.text :description
      t.text :external_links

      t.timestamps null: false
    end
  end
end
