class Post < ApplicationRecord
  include Publishable

  has_many :categorizations
  has_many :categories, -> { distinct }, through: :categorizations, dependent: :destroy
  belongs_to :user

  validates :title, :body, :user_id, presence: true

  scope :by_year, -> (year) {
    where(created_at: Date.new(year, 1, 1).all_year)
  }

  scope :by_month, -> (year, month) {
    where(created_at: Date.new(year, month, 1).all_month)
  }

  scope :by_day, -> (year, month, day) {
    where(created_at: Date.new(year, month, day).all_day)
  }
end
