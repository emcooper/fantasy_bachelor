FactoryGirl.define do
  factory :contestant do
    sequence :name {|n| "Contestant-#{n}"}
    user
  end
end
