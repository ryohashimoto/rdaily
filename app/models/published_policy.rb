module Rdaily
  class PublishedPolicyException < StandardError; end
end

class PublishedPolicy
  def initialize(model)
    unless model.class.columns_hash["published_at"] && model.class.columns_hash["published_at"].type == :datetime
      raise Rdaily::PublishedPolicyException, "Type of #{model.class}#published_at is not :datetime"
    end
    @model = model
  end

  def active?
    !!@model.published_at
  end

  def activate!
    @model.published_at = Time.current
    @model.save!
  end

  def stop!
    @model.published_at = nil
    @model.save!
  end
end
