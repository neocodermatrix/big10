class RemoveColumnEventIdFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :event_id, :string
  end
end
