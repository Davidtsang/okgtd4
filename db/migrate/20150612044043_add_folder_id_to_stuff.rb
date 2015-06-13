class AddFolderIdToStuff < ActiveRecord::Migration
  def change
    add_column :stuffs, :folder_id, :integer
  end
end
