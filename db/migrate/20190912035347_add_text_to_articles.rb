class AddTextToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :text, :text
    add_column :articles, :image, :string
    add_column :articles, :name, :string
  end
end
