class MakeBlogUrlRequired < ActiveRecord::Migration
  def up
    change_column :blogs, :url, :string, null: false
  end

  def down
    change_column :blogs, :url, :string
  end
end
