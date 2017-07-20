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
end
