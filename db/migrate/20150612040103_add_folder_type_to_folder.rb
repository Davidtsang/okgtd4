class AddFolderTypeToFolder < ActiveRecord::Migration
  def change
    add_column :folders, :folder_type, :integer
  end
end
