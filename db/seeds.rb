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
                     role: User.roles[:admin],
                     username: 'admin')

                     Item.create(name: "Python Programming 101", 
                      description: "This class is designed to teach you the basics of programming using Python. You'll learn how to write and debug simple programs, use loops and conditionals, and work with data structures like lists and dictionaries.",
                      photo: "data:image/png;base64,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",
                      price: 99.99,
                      mentor_name: "Jane Smith",
                      duration: "6 weeks")
          
          Item.create(name: "Web Development Bootcamp",
                      description: "In this intensive bootcamp, you'll learn how to build dynamic, responsive websites using HTML, CSS, and JavaScript. You'll also get hands-on experience with popular frameworks like React and Angular.",
                      photo: "https://truecoders.io/images/course-report-2023.png",
                      price: 149.99,
                      mentor_name: "John Doe",
                      duration: "12 weeks")
          
          Item.create(name: "Data Science Fundamentals",
                      description: "This course will introduce you to the basics of data science, including statistical analysis, data visualization, and machine learning. You'll work with real-world datasets and learn how to use tools like Python and R.",
                      photo: "https://images.credly.com/images/431ab5ba-1dc9-47dc-bce8-facb857b52ba/image.png",
                      price: 199.99,
                      mentor_name: "Sarah Johnson",
                      duration: "8 weeks")
          




