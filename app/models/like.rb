class Like < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.update(like_counter: post.likes.count)
  end
end
