class Post < ApplicationRecord
  include Publishable

  has_many :categorizations
  has_many :categories, -> { distinct }, through: :categorizations, dependent: :destroy
  belongs_to :user

  validates :title, :body, :user_id, presence: true
end
