class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, :uniqueness => true, :presence => true
  has_many :categorizations
  has_many :posts, :through => :categorizations
end
