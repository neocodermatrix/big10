class AddColumnToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :privacy_status, :boolean
  end
end
