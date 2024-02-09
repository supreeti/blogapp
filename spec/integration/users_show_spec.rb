require 'rails_helper'
RSpec.describe 'Users#shows', type: :integration do
  before(:all) do
    Comment.delete_all
    Post.delete_all
    User.delete_all
    @tom = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                       post_counter: 0)
    Post.create(author: @tom, title: 'Hello', text: 'This is my first post', comment_counter: 0, like_counter: 0)
    @lilly = User.create(name: 'Lilly', photo: 'https://placehold.co/200x133', bio: 'Teacher from Poland.',
                         post_counter: 0)
    @users = User.all
  end
end
