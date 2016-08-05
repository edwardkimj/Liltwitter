require 'faker'

30.times do |user|
    User.create(user_name: Faker::Name.name, email: Faker::Internet.email, password_hash: "yes" )
  end


200.times do |post|
  Post.create(content: Faker::Lorem.sentence, user_id: rand(30))
end

200.times do |relationship|
  Relationship.create(subscriber_id: rand(30), poster_id: rand(30))
end




