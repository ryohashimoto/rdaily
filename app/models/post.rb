class Post < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations, :dependent => :destroy
  
  belongs_to :user
  
  attr_accessible :title, :body, :published_at

  validates :title, :body, :user_id, :presence => true

  scope :published, where("published_at is not null")

  def published?
    !!self.published_at
  end
end
