module Publishable
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where.not(published_at: nil) }
  end

  def published?
    published_at.present?
  end

  def unpublished?
    !published?
  end

  def publish
    update(published_at: Time.current)
  end

  def unpublish
    update(published_at: nil)
  end
end
