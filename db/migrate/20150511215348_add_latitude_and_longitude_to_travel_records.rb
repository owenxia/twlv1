class AddLatitudeAndLongitudeToTravelRecords < ActiveRecord::Migration
  def change
    add_column :travel_records, :latitude, :float
    add_column :travel_records, :longitude, :float
  end
end
