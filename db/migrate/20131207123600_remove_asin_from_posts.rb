class RemoveAsinFromPosts < ActiveRecord::Migration
  def up
    remove_index :posts, :asin
    remove_column :posts, :asin
  end

  def down
    add_column :posts, :asin, :string
    add_index :posts, :asin, unique: true
  end
end
