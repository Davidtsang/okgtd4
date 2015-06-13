class AddNotNullToTable < ActiveRecord::Migration
  def change
    change_column_null :tags , :user_id , false
    change_column_null :stuffs, :user_id , false
    change_column_null :folders, :user_id, false

  end
end
