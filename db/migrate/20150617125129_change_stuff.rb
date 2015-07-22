class ChangeStuff < ActiveRecord::Migration
  def change
    #change_column :stuffs, :stuff_type, :type, :string, :null => false
    rename_column :stuffs, :stuff_type, :type
    change_column :stuffs, :type, :string, :null => false

  end
end
