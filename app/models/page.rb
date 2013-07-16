class Page < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :body, :published_at
  
  validates :title, :body, :user_id, presence: true
  
  scope :published, where("published_at is not null")

  def published_policy
    @published_policy ||= PublishedPolicy.new(self)
  end
end
