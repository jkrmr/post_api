FactoryGirl.define do
  factory :image do
    url 'http://example.com/image.jpg'
    association :post
  end
end
