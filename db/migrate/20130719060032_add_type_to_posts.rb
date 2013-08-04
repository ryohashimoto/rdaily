class AddTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :type, :string
    
    Post.find_each do |post|
      post.type = 'Post'
      post.save!
    end
  end
end
