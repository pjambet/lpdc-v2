
FactoryGirl.define do
  factory :gold_book, :class => Refinery::GoldBooks::GoldBook do
    sequence(:author) { |n| "refinery#{n}" }
  end
end

