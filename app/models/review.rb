class Review < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :body, :user_id, :presence => true

  scope :published, where("published_at is not null") 
  
  def published_policy
    @published_policy ||= PublishedPolicy.new(self)
  end
end
