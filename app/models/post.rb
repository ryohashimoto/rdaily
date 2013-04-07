class Post < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :body, :published_at

  validates :title, :body, :user_id, :presence => true

  scope :published, where("published_at not ?", nil)

  def published?
    !!self.published_at
  end
end
