class User < ActiveRecord::Base
  has_many :posts

  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates :email, :presence => :true, :uniqueness => :true
end
