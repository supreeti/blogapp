require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user, name: 'Supreeti') }
  let(:post) { create(:post, title: 'Test user') }

  describe 'callbacks' do
    it 'updates the comments_counter after save' do
      comment = build(:comment, post:, user:) # Use the post and user objects
      expect { comment.save }.to change { post.reload.comment_counter }.by(1)
    end
  end
end
