class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :slide, counter_cache: :likes_count
end
