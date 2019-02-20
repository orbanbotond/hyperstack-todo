# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create email: "boti@gmail.com", 
                first_name: "Boti",
                last_name: "Orban",
                password: 'pokolgep',
                password_confirmation: 'pokolgep'

user_2 = User.create email: "gyongyi@gmail.com", 
                first_name: "Gyongyi",
                last_name: "Orban",
                password: 'pokolgep',
                password_confirmation: 'pokolgep'

o1 = Organization.create name: 'Logic Optimum',
                        description: 'A One Person RoR shop'

o1.projects.create name: "HyperStack",
                   description: "Learn Hyperstack out of the box."

o1.projects.create name: "Business Analize",
                   description: "Learn to be a stellar Business Analyst"

o2 = Organization.create name: '<Epam>',
                        description: 'Central Europes Largest Software Solution Provider'

o1.users << user
o1.users << user_2
o2.users << user_2


