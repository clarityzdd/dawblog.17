class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :name
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
