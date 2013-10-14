class AddJoinTables < ActiveRecord::Migration
  def change
    create_table :user_blogs do |t|
      t.integer :blog_id
      t.integer :user_id
    end

    add_column :categories, :user_id, :integer, null: false
  end
end
