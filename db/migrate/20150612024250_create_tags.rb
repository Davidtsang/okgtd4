class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :user_id
      t.integer :status
      t.integer :the_type

      t.timestamps
    end
  end
end
