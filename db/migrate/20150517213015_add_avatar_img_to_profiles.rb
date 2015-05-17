class AddAvatarImgToProfiles < ActiveRecord::Migration
  def self.up
    add_attachment :users, :avatar_img
  end

  def self.down
    remove_attachment :users, :avatar_img
  end
end
