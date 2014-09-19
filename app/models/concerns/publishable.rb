module Publishable
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where.not(published_at: nil) }
  end

  def published_policy
    @published_policy ||= PublishedPolicy.new(self)
  end
end
