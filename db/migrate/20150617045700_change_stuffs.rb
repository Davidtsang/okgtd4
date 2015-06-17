class ChangeStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :name, :string
    add_column :stuffs, :stuff_type, :integer, default:0
    add_column :stuffs, :parent_id,:integer

  end
end
