class RemoveColumnPrivacyStatusFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :privacy_status, :string
  end
end
