class CreateEventRequests < ActiveRecord::Migration
  def change
    create_table :event_requests do |t|
      t.references :requestor, references: :user, index: true
      t.references :receiving, references: :user, index: true
      t.references :event, references: :event, index: true
      t.boolean :approval

      t.timestamps null: false
    end
  end
end
