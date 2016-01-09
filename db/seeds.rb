require 'faker'

50.times do
  User.create( username: Faker::Internet.user_name,
               password: "password")
end

20.times do
  Post.create( user_id: rand(1..50),
           title: Faker::Lorem.words(4).join(" "),
           body: Faker::Lorem.sentences(4).join(" ") )
end

20.times do
  Response.create( user_id: rand(1..50),
                body: Faker::Lorem.sentences(2).join(" "),
                comment_id: rand(1..20),
                comment_type: "Post" )
end

30.times do
    Response.create( user_id: rand(1..50),
                body: Faker::Lorem.sentences(2).join(" "),
                comment_id: rand(1..20),
                comment_type: "Response" )
end
