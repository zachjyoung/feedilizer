class RemoveNameFromBlogs < ActiveRecord::Migration
  def up
    remove_column :blogs, :name
    remove_column :blogs, :summary
    remove_column :blogs, :published_at
    add_column :blogs, :title, :string
  end
  def down
    add_column :blogs, :name, :string
    add_column :blogs, :summary, :text
    add_column :blogs, :published_at, :datetime
    remove_column :blogs, :title
  end
end
