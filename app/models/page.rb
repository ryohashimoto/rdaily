class Page < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :body, :user_id, presence: true
  validates :slug, presence: true, uniqueness: true, format: { with: /^[a-z][_a-z0-9]*/i }, length: { maximum: 16 }
  
  scope :published, where("published_at is not null")

  def published_policy
    @published_policy ||= PublishedPolicy.new(self)
  end
end
