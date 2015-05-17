class RemoveImgFromUsers < ActiveRecord::Migration
  def self.up
    remove_attachment :users, :avatar_img
  end

  def self.down
    add_attachment :users, :avatar_img
  end
end
