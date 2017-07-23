FactoryGirl.define do
  factory :user do
    sequence :team_name {|n| "Team #{n}"}
    role 0
    sequence :email {|n| "user#{n}@gmail.com"}
    password_digest "password_digest"
  end

  trait :admin do
    role 1
  end

  trait :with_1_contestants_with_5_points_each_week do
    after(:create) do |user|
      contestant = create(:contestant, user: user)
      create_list(:week, 12)
      play = create(:play, point_value: 5)
      Week.all.each do |week|
        week.contestants << contestant
        create(:weekly_score, contestant: contestant, week: week, play: play)
      end
    end
  end

    trait :with_1_contestants_with_10_points_each_week do
      after(:create) do |user|
        contestant = create(:contestant, user: user)
        create_list(:week, 12)
        play = create(:play, point_value: 5)
        Week.all.each do |week|
          week.contestants << contestant
          create(:weekly_score, contestant: contestant, week: week, play: play, play_count:2)
        end
      end
    end
  end
