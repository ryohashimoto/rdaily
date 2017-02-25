class Post < ApplicationRecord
  include Publishable

  has_many :categorizations
  has_many :categories, -> { uniq }, through: :categorizations, dependent: :destroy
  belongs_to :user

  validates :title, :body, :user_id, presence: true

  def categorization_builder
    @categorization_builder ||= CategorizationBuilder.new(self)
  end
end
