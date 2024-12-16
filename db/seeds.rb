# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(email: "", password: "")

genre_names = ["有酸素", "腕", "腹", "足"]

genre_names.each do |name|
  Genre.create!(name: name)
end

# rails db:reset

# rails db:migrate:reset
# rails db:seed