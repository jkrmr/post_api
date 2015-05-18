FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Postapp User #{n}" }
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

    # factory :comments_thread do
    #   after(:create) do |comment|
    #     child = create(:comment, commentable: comment)
    #     child.make_child_of id: comment.id
    #   end
    # end
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

    # factory :post_with_comments_thread do
    #   after(:create) do |post|
    #     create(:comments_thread, commentable: post)
    #   end
    # end
  end
end
