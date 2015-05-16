class AddAttachmentCoverToExperiences < ActiveRecord::Migration
  def self.up
    change_table :experiences do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :experiences, :cover
  end
end
