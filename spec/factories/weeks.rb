FactoryGirl.define do
  factory :week do
    date "2017-07-18"
    week_number {rand(1..12)}
  end
end
