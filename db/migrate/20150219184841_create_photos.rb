class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :album
      t.string :name
      t.string :description
      t.string :link
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
