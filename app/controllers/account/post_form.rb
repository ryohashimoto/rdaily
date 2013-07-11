module Account
  class PostForm
    include ActiveModel::Validations
    attr_accessor :title, :body, :category_ids, :published_at
    validates :title, :body, :category_ids, :presence => true

    def initialize(params)
      @title = params[:title]
      @body = params[:body]
      set_category_ids(params)
      set_published_at(params)
    end

    def to_params
      { title: @title, body: @body, published_at: @published_at }
    end

    def set_category_ids(params)
      ids = params[:category_ids]
      if ids && ids != "0"
        @category_ids = []
        @category_ids = ids.split(',').map(&:to_i)
        if @category_ids[0] == 0
          @category_ids.shift
        end
      end
    end

    def set_published_at(params)
      published = params[:published]
      if published == "1"
        @published_at = Time.now
      else
        @published_at = nil
      end
    end
  end
end
