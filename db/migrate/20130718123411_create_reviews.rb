class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.datetime :published_at
      t.string :asin

      t.timestamps
    end
    
    add_index :reviews, :id, :unique => true
    add_index :reviews, :published_at    
  end
end
