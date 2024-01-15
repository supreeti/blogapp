FactoryBot.define do
  factory :comment do
    text { 'This is a comment' }
    user
    post
  end
end
