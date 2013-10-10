class ChangeNameToAricleName < ActiveRecord::Migration
  def up
    add_column :feed_entries, :title, :string
  end

  def down
    remove_column :feed_entries, :title
  end
end
