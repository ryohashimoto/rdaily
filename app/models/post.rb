class Post < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :body, :published_at, :published

  validates :title, :body, :user_id, :presence => true
end
