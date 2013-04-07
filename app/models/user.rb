class User < ActiveRecord::Base
  has_many :posts
  has_many :categories

  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates :email, :presence => :true, :uniqueness => :true
end
