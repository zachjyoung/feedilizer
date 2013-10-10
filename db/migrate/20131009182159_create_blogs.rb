class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :url
      t.text :summary
      t.string :guid
      t.datetime :published_at
      t.string :name

      t.timestamps
    end
  end
end
