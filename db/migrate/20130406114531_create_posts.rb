class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.datetime :published_at

      t.timestamps
    end

    add_index :posts, :id, :unique => true
    add_index :posts, :published_at
  end
end
