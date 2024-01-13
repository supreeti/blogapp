class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :comments
  has_many :likes

  attribute :title, :string
  attribute :text, :text
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:PostsCounter)
  end
end
