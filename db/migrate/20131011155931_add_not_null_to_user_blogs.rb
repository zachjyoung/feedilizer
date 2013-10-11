class AddNotNullToUserBlogs < ActiveRecord::Migration
  def up
    change_column :user_blogs, :user_id, :integer, null: false
    change_column :user_blogs, :blog_id, :integer, null: false 
  end

  def down
    change_column :user_blogs, :user_id, :integer, null: true
    change_column :user_blogs, :blog_id, :integer, null: true 
  end
end
