class AddDefaultValueToUserAndFolder < ActiveRecord::Migration
  def change
    change_column :users, :stuffs_count, :integer, default: 0
    change_column :folders, :stuffs_count, :integer, default: 0
  end
end
