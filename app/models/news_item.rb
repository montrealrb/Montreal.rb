class NewsItem < ActiveRecord::Base
  translates :title, :state, :body
end
