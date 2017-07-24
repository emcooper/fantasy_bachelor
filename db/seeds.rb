
ellen = User.create(team_name: "The Final Rose", email: "ellen@gmail.com", role: "admin", password: "ellen1", password_confirmation: "ellen1")
hayley = User.create(team_name: "Here for the Wrong Reasons", email: "hayley@gmail.com", password: "hayley1", password_confirmation: "hayley1")
diana = User.create(team_name: "Here for the Right Reasons", email: "diana@gmail.com", password: "diana1", password_confirmation: "diana1")
user4 = User.create(team_name: "Roses 4 Dayzz", email: "other_person@gmail.com", password: "otherperson1", password_confirmation: "otherperson1")

contestants = ["Alexis",	"Angela",	"Astrid",	"Briana",	"Brittany",	"Christen",
              "Corinne", "Danielle L.", 	"Danielle M.", 	"Dominique",	"Liz",
              "Elizabeth",	"Hailey", "Ida Marie",	"Jaimi",	"Jasmine B.",
              "Jasmine G.", 	"Josephine", "Kristina",	"Lacey",	"Lauren",	"Michelle",
              "Olivia",	"Rachel",	"Raven", "Sarah", "Susannah",	"Taylor",	"Vanessa",	"Whitney"]

weeks = ["1/5/17", "1/12/17", "1/19/17", "1/26/17", "2/2/17", "2/9/17",
        "2/16/17", "2/23/17", "3/2/17", "3/9/17", "3/16/17", "3/23/17"]

plays = {"Rose Ceremony Rose" => 10,
"Group Date Rose" => 20,
"First Impression Rose" => 30,
"One-on-One Rose" => 20,
"Sent Home on One-on-One" => 30,
"Two-on-One Rose" => 30,
"Sent Home on Two-on-One" => 20,
"Quits the Show" => 50,
"Attempts to Return to Show After Being Eliminated" => 30,
"'Steals' Nick away (MUST SAY 'STEAL')" => 10,
"'Fairytale'" => 10,
"'For the right reasons'" => 10,
"'Journey'" => 10,
"'I’m not here to make friends'" => 10,
"'Luckiest girl in the world'" =>  10,
"First to tell Nick she is falling in love" => 20,
"Tells Nick she is falling in Love (not first)" => 10,
"Reveals tragic backstory" => 15,
"Wins non-rose competition on a group date" => 10,
"Full Nudity" => 25,
"Requires medical attention" => 25,
"References parents’ relationship as inspiration" => 10,
"Helicopter Ride" => 10,
"Treated to a private concert" => 10,
"Discusses another Contestant with Bachelor" => 10,
"Calls someone 'old'" => 10,
"Drunk at a rose ceremony" => 10,
"Says set location is 'the perfect place to fall in love'" =>  10,
"Makes Nick Cry" => 30,
"Cries" => 5,
"Makes another Contestant Cry" => 20,
"Wins" => 50}

contestants.each_with_index do |contestant, index|
  ellen.contestants.create!(name: contestant, headshot: Faker::Avatar.image) if index % 4 == 0
  hayley.contestants.create!(name: contestant, headshot: Faker::Avatar.image) if index % 4 == 1
  diana.contestants.create!(name: contestant, headshot: Faker::Avatar.image) if index % 4 == 2
  user4.contestants.create!(name: contestant, headshot: Faker::Avatar.image) if index % 4 == 3
end

week_counter = 1
weeks.each do |date|
  Week.create!(date: date, week_number: week_counter)
  week_counter += 1
end

plays.each do |description, points|
  Play.create!(description: description, point_value: points)
end
