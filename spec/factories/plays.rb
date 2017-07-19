FactoryGirl.define do
  factory :play do
    sequence :description {|n| "Says 'I'm not here to make friends' #{n}"}
    point_value {rand(1..50)}
  end
end
