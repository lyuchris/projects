class AddPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :title, :string
  	add_column :posts, :content, :text
  end
end
