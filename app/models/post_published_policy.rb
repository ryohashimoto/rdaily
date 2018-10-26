class PostPublishedPolicy
  def initialize(post)
    @post = post
  end

  def active?
    @post.published_at.present?
  end

  def activate!
    @post.published_at = Time.current
    @post.save!
  end

  def stop!
    @post.published_at = nil
    @post.save!
  end
end
