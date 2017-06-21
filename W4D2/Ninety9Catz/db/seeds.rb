# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all 

cat1 = Cat.create(
  birth_date: 10.years.ago,
  color: :orange,
  name: :Timmy,
  sex: :Z,
  description: "Timmy was my favorite cat everest"
  )

cat1 = Cat.create(
  birth_date: 3.years.ago,
  color: :tabby,
  name: :Jonah,
  sex: :F,
  description: "Jonah was as sweet as ice cream and loved to eat ice cream too actually"
  )
