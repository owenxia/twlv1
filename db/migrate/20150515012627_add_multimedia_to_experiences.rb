class AddMultimediaToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :multimedia, :text
  end
end
