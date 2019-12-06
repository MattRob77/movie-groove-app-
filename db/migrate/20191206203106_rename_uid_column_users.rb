class RenameUidColumnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :uid_string, :uid
  end
end
