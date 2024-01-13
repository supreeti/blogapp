class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  belongs_to :author, class_name: 'User'

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(commentsCounter: post.comments.count)
  end
end
