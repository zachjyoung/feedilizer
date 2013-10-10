class AddXmlUrlToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :feed_url, :string, null: false 
  end
end
