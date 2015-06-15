class AddStuffsCountToFolder < ActiveRecord::Migration
  def change
    add_column :folders, :stuffs_count, :integer
  end
end
