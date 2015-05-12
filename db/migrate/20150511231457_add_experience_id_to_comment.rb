class AddExperienceIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :experience_id, :integer
  end
end
