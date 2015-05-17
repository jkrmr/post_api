FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Postapp User #{n}" }
    sequence(:city) { |n| "City #{n}" }
  end
end
