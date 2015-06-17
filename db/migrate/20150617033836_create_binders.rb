class CreateBinders < ActiveRecord::Migration
  def change
    create_table :binders do |t|
      t.string :name
      t.integer :user_id
      t.integer :status
      t.integer :stuffs_count, :default => 0
      t.integer :the_type

      t.timestamps
    end
  end
end
