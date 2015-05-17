class AddDeleteAvatarToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :delete_avatar, :boolean
  end
end
