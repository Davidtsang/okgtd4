class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.text :content
      t.datetime :deadline
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
