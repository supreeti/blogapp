require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should update comments counter after save' do
    comment = create(:comment)
    post = comment.post
    expect do
      comment.update_attribute(:attribute, 'new value')
      post.reload
    end.to change(post, :comment_counter).by(1)
  end
end
