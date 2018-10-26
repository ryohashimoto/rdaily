class Account::PostForm
  include ActiveModel::Validations
  attr_accessor :title, :body, :category_ids
  validates :title, :body, :category_ids, presence: true

  def initialize(params)
    @title = params[:title]
    @body = params[:body]
    set_category_ids(params)
  end

  def to_params
    { title: @title, body: @body }
  end

  def set_category_ids(params)
    ids = params[:category_ids]
    @category_ids = []
    if ids && ids != "0"
      @category_ids = ids.split(',').map(&:to_i)
      @category_ids.shift if @category_ids[0] == 0
    end
  end
end
