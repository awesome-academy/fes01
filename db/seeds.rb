# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "admin",
            email: "be@gmail.com",
            phone: "1234567890",
            password: "123456",
            password_confirmation: "123456",
            role: 0)

User.create!(name: "lethibe",
            phone: "1234567890",
            email: "be1@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            role: 1)
