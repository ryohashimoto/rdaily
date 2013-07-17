class User < ActiveRecord::Base
  has_many :posts
  has_many :pages
  has_many :categories
  has_many :photos

  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates :email, :presence => :true, :uniqueness => :true
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  include Gravtastic
  gravtastic :size => 48
end
