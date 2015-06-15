class AddStuffsCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :stuffs_count, :integer
  end
end
