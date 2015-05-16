class AddGraddedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gradded, :boolean
  end
end
