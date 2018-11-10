# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning boulders database...'
Boulder.destroy_all


puts 'Creating boulders...'
boulder_attributes = [
  {
    name: "Le Flipper",
    grade: "7A+",
    position_min: "21",
    position_sec: "50",
    link: "https://vimeo.com/111277558"
  },
  {
    name: "Duel dans la lune",
    grade: "6c",
    position_min: "00",
    position_sec: "00",
    link: "https://vimeo.com/89820845"
  },
  {
    name: "Indestructible",
    grade: "7a+",
    position_min: "00",
    position_sec: "00",
    link: "https://vimeo.com/23152816"
  },
  {
    name: "Egoiste assis",
    grade: "7a+",
    position_min: "07",
    position_sec: "35",
    link: "https://www.youtube.com/watch?v=9tEjvZsCSyk"
  },
]
Boulder.create!(boulder_attributes)
puts 'Finished!'
