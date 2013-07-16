class Page < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :body, :published_at
  
  validates :title, :body, :user_id, presence: true
  validates :slug, uniqueness: true, format: { with: /^[a-z][_a-z0-9]*/i }, length: { maximum: 16 }
  
  scope :published, where("published_at is not null")

  def published_policy
    @published_policy ||= PublishedPolicy.new(self)
  end
end
