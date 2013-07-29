class Review < Post
  validates :asin, presence: true, uniqueness: true
  
  def review?
    true
  end
end
