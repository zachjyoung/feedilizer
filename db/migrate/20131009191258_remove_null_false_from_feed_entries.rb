class RemoveNullFalseFromFeedEntries < ActiveRecord::Migration
  def up
    change_column :feed_entries, :summary, :string, :null => true
    remove_column :blogs, :guid
  end

  def down
    change_column :feed_entries, :summary, :string, :null => false
    add_column :blogs, :guid, :string
  end
end
