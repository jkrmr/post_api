FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    sequence(:content) { |n| "Post #{n}'s content." }
    association :author, factory: :user
  end
end
