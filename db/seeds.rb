# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
HobbyCategory.destroy_all
UserCategory.destroy_all
Category.destroy_all


category_images = ["https://s-media-cache-ak0.pinimg.com/originals/41/20/83/412083f76fe2e72b979902158f91d2bf.jpg", "http://www.chegg.com/play/wp-content/uploads/sites/3/2013/02/cooking-college.jpg", "http://images2.aystatic.com/articles/1954/224004_home_hero.jpg?1431670534", "http://www.lynchburgparksandrec.com/wp-content/uploads/2015/12/kniting-tips.jpg", "https://s-media-cache-ak0.pinimg.com/736x/90/e1/20/90e1208eb953b69c86e48a6c24d6c5c5.jpg", "http://wwwcmuseorg-lvzm5mr0z.stackpathdns.com/wp-content/uploads/2014/10/music-apps-for-ipad.jpg", "https://antedote.com/wp-content/uploads/2015/12/Language.jpg", "http://cdn.liquor.com/wp-content/uploads/2015/03/hub_classic_cocktail_margarita.jpg" ]
category_names = ['Woodworking', 'Cooking', 'Pottery', 'Knitting', 'Drawing', 'Music', 'Language', 'Cocktails']
8.times do |index|
  Category.create(name: category_names[index], photo_url: category_images[index])
end
