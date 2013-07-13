class Post < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations, :uniq => true, :dependent => :destroy
  
  belongs_to :user
  
  attr_accessible :title, :body, :published_at

  validates :title, :body, :user_id, :presence => true

  scope :published, where("published_at is not null") 
  
  def published_policy
    @published_policy ||= PublishedPolicy.new(self)
  end
  
  def categorization_builder
    @categorization_builder ||= CategorizationBuilder.new(self)
  end
end
