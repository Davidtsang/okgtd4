class RenameTagsStuffs < ActiveRecord::Migration
  def change
    rename_table :tags_stuffs, :stuffs_tags

  end
end
