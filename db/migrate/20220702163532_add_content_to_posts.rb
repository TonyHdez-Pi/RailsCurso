class AddContentToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :content, :rich_text
  end
end
