class AddLikesCountToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :likes_count, :integer
  end
end
