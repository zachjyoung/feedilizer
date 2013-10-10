class AddBlogIdToFeedEntriesAndAddCategoryToBlogs < ActiveRecord::Migration
  def change
    add_column :feed_entries, :blog_id, :integer, null: false

    create_table :blog_categorizations do |t|
      t.integer :blog_id, null: false
      t.integer :category_id, null: false
    end

    create_table :categories do |t|
      t.string :name, null: false
    end

  end
end
