# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



DESCRIPTIONS = %w(movies food drinks gas utilities dogfood water sundries)

mike = User.create(name: "Michael", nickname: "Mike", email: "mike@g.com")
bob = User.create(name: "Robert", nickname: "Bob", email: "bob@g.com")
joe = User.create(name: "Joseph", nickname: "Joe", email: "joe@g.com")
anne = User.create(name: "Anne", nickname: "Annie", email: "annie@g.com")
rocky = User.create(name: "Raquel", nickname: "Rocky", email: "rocky@g.com")
bbq = Group.create(name: "BBQ", currency_type: "Pony", admin: bob)
school = Group.create(name: "School", currency_type: "Spoon", admin: anne)
lonely = Group.create(name: "Loneliness")
mike.groups << bbq
school.users << [bob, joe,anne]
# school.admin(bob)
bbq.users << [joe,bob,anne]
# bbq.admin(joe)

contents = ["Woopidoopidubdub", "Hello fellas!", "Who is you daddy?", "show me the money Lewbowski!", "Oh it is somewhere down there, let me have another look", "why me?", "42 is the meaning of life because the ASCII character number 42 is *, which means the meaning of life is anything you want it to be.", "English mootherf****r, do you speak it?"]

(5+rand(5)).times do
    Message.create(user: bbq.users.sample, group: bbq, content: contents.sample)
end

(5+rand(5)).times do
    Message.create(user: school.users.sample, group: school, content: contents.sample)
end

(5+rand(5)).times do
    Payment.create(user: mike, group: bbq, amount: 1+rand(50)+rand(50), description: DESCRIPTIONS.sample)
end

15.times do
    Payment.create(user: [bob, joe].sample, group: [bbq, school].sample, amount: 30+rand(70), description: DESCRIPTIONS.sample)
end

15.times do
    Payment.create(user: [bob, joe, anne].sample, group: [bbq, school].sample, amount: 10+rand(90), description: DESCRIPTIONS.sample)
end
