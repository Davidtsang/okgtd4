class AddCounterCacheToTags < ActiveRecord::Migration
  def change
    add_column :tags, :stuffs_count, :integer, default: 0

  end
end
