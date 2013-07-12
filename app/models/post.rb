class Post < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations, :uniq => true, :dependent => :destroy
  
  belongs_to :user
  
  attr_accessible :title, :body

  validates :title, :body, :user_id, :presence => true

  scope :published, where("published_at is not null")

  def published?
    !!self.published_at
  end
  
  def publish!
    self.published_at = Time.now
    self.save!
  end
  
  def unpublish!
    self.published_at = nil
    self.save!
  end
end
