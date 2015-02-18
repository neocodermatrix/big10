class AddColumnEventIdToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :event, index: true
    add_foreign_key :posts, :events
  end
end
