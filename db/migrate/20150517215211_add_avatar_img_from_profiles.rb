class AddAvatarImgFromProfiles < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :avatar_img
  end

  def self.down
    remove_attachment :profiles, :avatar_img
  end
end
