
FactoryGirl.define do
  factory :distributor, :class => Refinery::Distributors::Distributor do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

