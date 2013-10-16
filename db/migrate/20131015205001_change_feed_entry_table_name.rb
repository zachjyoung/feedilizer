class ChangeFeedEntryTableName < ActiveRecord::Migration
  def up
    rename_table :feed_entries, :blog_entries
  end

  def down
    rename_table :blog_entries, :feed_entries
  end
end
