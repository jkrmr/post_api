FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "PostApi User #{n}" }
    sequence(:city) { |n| "City #{n}" }
  end

  factory :image do
    url 'http://example.com/image.jpg'
    post
  end

  factory :comment do
    content 'This is a comment!'
    association :author, factory: :user
    association :commentable, factory: :post
  end

  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    sequence(:content) { |n| "Post #{n}'s content." }
    association :author, factory: :user

    factory :post_with_comment do
      after(:create) do |post|
        create(:comment, commentable: post)
      end
    end
  end
end
