FactoryGirl.define do
  factory :week do
    date "2017-07-18"
    week_number {rand(1..12)}
  end

  trait :with_6_contestants do
    after(:create) do |week|
      create_list(:weekly_contestant, 6, week: week)
    end
  end

  trait :with_3_plays do
    after(:create) do |week|
      create_list(:weekly_play, 3, week: week)
    end
  end
end
