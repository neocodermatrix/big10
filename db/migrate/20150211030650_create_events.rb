class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.float :cost
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :attendees

      t.timestamps null: false
    end
  end
end
