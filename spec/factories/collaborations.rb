# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collaboration do
    user_id 1
    item_id 1
    complete false
    allocator 1
  end
end
