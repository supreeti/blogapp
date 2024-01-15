FactoryBot.define do
  factory :user do
    name { 'Supreeti' }
    photo { 'Image' }
    bio { 'developer' }
    post_counter { 0 }

    factory :user_with_comments do
      transient do
        comments_count { 5 } # Adjust the count as needed
      end

      after(:create) do |user, evaluator|
        create_list(:comment, evaluator.comments_count, user:)
      end
    end
  end
end
