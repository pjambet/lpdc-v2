
FactoryGirl.define do
  factory :news_item, :class => Refinery::NewsItems::NewsItem do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

