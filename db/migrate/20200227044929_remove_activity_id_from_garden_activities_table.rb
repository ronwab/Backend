class RemoveActivityIdFromGardenActivitiesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :garden_activities, :activity_id
  end
end
