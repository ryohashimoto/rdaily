class Post < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :body, :published_at

  validates :title, :body, :published_at, :user_id, :presence => true
end
