class RemoveColumnIsPublicFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_public, :boolean
  end
end
