class AddAsinUniquenessIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :asin, unique: true
  end
end
