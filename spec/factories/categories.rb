# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
    description "MyText"
    group_id 1
    item_id 1
  end
end
