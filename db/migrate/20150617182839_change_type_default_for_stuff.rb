class ChangeTypeDefaultForStuff < ActiveRecord::Migration
  def change
    change_column_default :stuffs, :type, nil
  end
end
