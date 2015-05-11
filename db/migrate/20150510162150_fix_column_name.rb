class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :profiles, :location, :country
  end
end
