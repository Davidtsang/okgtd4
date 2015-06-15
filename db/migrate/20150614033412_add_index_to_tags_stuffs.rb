class AddIndexToTagsStuffs < ActiveRecord::Migration
  def change
    add_index :tags_stuffs, [:tag_id, :stuff_id], unique: true

  end
end
