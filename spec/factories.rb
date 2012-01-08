Factory.define :user do |user|
  user.username     Faker::Name.first_name + "-" + Faker::Name.last_name
end

Factory.define :checklist do |checklist|
  checklist.title   Faker::Lorem.sentence(1)
  checklist.description Faker::Lorem.sentence(5)
  checklist.owner  Factory(:user)
end

Factory.define :item do |item|
  item.title  Faker::Name.last_name
  item.complete true
end