# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  ['ケーキ'],
  ['焼き菓子'],
  ['プリン'],
  ['キャンディ'],
  ['和菓子'],
].each do |name|
  Genre.create!(
    { name: name }
  )
end
