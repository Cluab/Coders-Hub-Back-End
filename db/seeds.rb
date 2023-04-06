# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create!(name: 'Web Client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create!(name: 'iOS Client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create!(name: 'Android Client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create!(name: 'React', redirect_uri: '', scopes: '')
end

 User.first_or_create(email: 'admin@example.com',
                     password: 'password',
                     password_confirmation: 'password',
                     role: User.roles[:admin])

Item.create(name: 'Item 1', description: 'Item 1 description', price: 10)

Item.create(name: "Item 1", 
photo: "https://avatars.githubusercontent.com/u/53082877?s=400&u=8432a4860f75013af57e50bbbd974a89e51e94c9&v=4", 
description: "This is item 1")
Item.create(name: "Item 2", 
photo: "https://avatars.githubusercontent.com/u/53082877?s=400&u=8432a4860f75013af57e50bbbd974a89e51e94c9&v=4", 
description: "This is item 2")
Item.create(name: "Item 3", 
photo: "https://avatars.githubusercontent.com/u/53082877?s=400&u=8432a4860f75013af57e50bbbd974a89e51e94c9&v=4", 
description: "This is item 3")
Item.create(name: "Item 4", 
photo: "https://avatars.githubusercontent.com/u/53082877?s=400&u=8432a4860f75013af57e50bbbd974a89e51e94c9&v=4", 
description: "This is item 4")
Item.create(name: "Item 5", 
photo: "https://avatars.githubusercontent.com/u/53082877?s=400&u=8432a4860f75013af57e50bbbd974a89e51e94c9&v=4", 
description: "This is item 5")




