# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
ShortenedUrl.destroy_all

user1 = User.create(email: "hiya@worldly.com")
user2 = User.create(email: "hello@world.com")
user3 = User.create(email:"nyc@cmail.com")
user4 = User.create(email:"california@bmail.com")
user5 = User.create(email:"texas@cmail.com")


short1 = ShortenedUrl.urlfactory(user1, "stuff")
short2 = ShortenedUrl.urlfactory(user2, "google.com\/hhhhhhhheeeeeellllloooo")
short3 = ShortenedUrl.urlfactory(user3, "youtube.com\/thiiiiiiiiisssssss")
short4 = ShortenedUrl.urlfactory(user2, "youtube.com\/theeerrrrrreeeeeee")
ShortenedUrl.urlfactory(user1, "facebook.comarrrrrrrrrrrrrr")
ShortenedUrl.urlfactory(user1, "madeup.com\/pirate-life")
ShortenedUrl.urlfactory(user4, "youtube.com\/appAallday")
ShortenedUrl.urlfactory(user5, "hi.com\/notadup")
ShortenedUrl.urlfactory(user3, "sdfsdg.com\/below_is_a_dup")
ShortenedUrl.urlfactory(user1, "youtube.com\/this-is-a-long-chain")

p User.all
p ShortenedUrl.all
