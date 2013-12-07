class PostPublishedPolicy
  def initialize(post)
    @post = post
  end

  def active?
    !!@post.published_at
  end

  def activate!
    @post.published_at = Time.now
    @post.save!
  end

  def stop!
    @post.published_at = nil
    @post.save!
  end
end
