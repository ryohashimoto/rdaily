class Review < Post
  validates :asin, presence: true, uniqueness: true
  
  def review?
    true
  end

  def product
    Product.find_by(asin: self.asin)
  end
end
