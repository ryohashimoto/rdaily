class Category < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :user_id, presence: true
  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug

  has_many :categorizations
  has_many :posts, through: :categorizations
  belongs_to :user

  def to_param
    slug
  end

  def generate_slug
    return nil unless name
    self.slug ||= name.parameterize
  end
end
