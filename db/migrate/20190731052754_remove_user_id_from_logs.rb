class RemoveUserIdFromLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :member, :text
  end
end
