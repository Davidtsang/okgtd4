class CreateTagsStuffs < ActiveRecord::Migration
  def change
    create_table :tags_stuffs ,id: false  do |t|
      t.belongs_to :tag
      t.belongs_to :stuff
    end
  end
end
