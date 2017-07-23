FactoryGirl.define do
  factory :contestant do
    sequence :name, ["A", "C", "B"].cycle do |n|
      "Contestant #{n}"
    end
    user
  end
end
