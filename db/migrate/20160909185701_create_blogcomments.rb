class CreateBlogcomments < ActiveRecord::Migration
  def change
    create_table :blogcomments do |t|
      t.integer :user_id
      t.text :body
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
