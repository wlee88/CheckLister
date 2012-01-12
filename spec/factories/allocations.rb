# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :allocation do
    user_id 1
    item_id 1
    complete false
    allocator_id 1
  end
end
