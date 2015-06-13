class AddNotNullToStuff < ActiveRecord::Migration
  def change
    change_column_null :stuffs , :folder_id ,false
    change_column_null :stuffs , :status ,false

  end
end
