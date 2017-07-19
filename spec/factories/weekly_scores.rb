FactoryGirl.define do
  factory :weekly_score do
    contestant
    play
    week
    play_count {rand(1..5)}
  end
end
