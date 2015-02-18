class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :string
    add_column :posts, :event_id, :string
  end
end
