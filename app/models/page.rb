class Page < ActiveRecord::Base
  attr_accessible :body, :published_at, :sequence, :title, :user_id
end
