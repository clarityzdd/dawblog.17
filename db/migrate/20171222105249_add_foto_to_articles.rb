class AddFotoToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :foto, :string
  end
end
