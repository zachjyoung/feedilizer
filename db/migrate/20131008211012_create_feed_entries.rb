class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :name, null: false
      t.text :summary
      t.string :url, null: false
      t.datetime :published_at, null: false
      t.string :guid, null: false

      t.timestamps
    end
  end
end
