class Post < ActiveRecord::Base
  validates :reddit_id, uniqueness: true
end