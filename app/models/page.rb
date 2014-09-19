class Page < ActiveRecord::Base
  include Publishable

  belongs_to :user
  
  validates :title, :body, :user_id, presence: true
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-z][_a-z0-9]*/i }, length: { maximum: 16 }  
end
