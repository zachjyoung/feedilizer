class ChangeSummaryToText < ActiveRecord::Migration
  def up 
    change_column :feed_entries, :summary, :text 
  end

  def down
    change_column :feed_entries, :summary, :string
  end
end
