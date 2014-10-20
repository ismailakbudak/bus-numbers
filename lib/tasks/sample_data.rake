
# Gem file
# gem 'faker', '1.1.2'

# Taskı çalıştırmak için
# rake db:reset
# rake db:populate

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      name        = Faker::Name.name
      description = Faker::Lorem.sentence(1)
      price       = 12 
      Product.create!(name:         name,
                      description:  description,
                      price:        price )
    end
    #make_products 
  end
end

#def make_products 
#  99.times do |n|
#    name        = Faker::Name.name
#    description = Faker::Lorem.sentence(1)
#    price       = 12 
#    Product.create!(name:         name,
#                    description:  description,
#                    price:        price )
#  end
#end
 