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
            email: "15i1lethibe@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            role: 1)

Category.create!(name: "Category1", parent_id: "")
Category.create!(name: "Category2")
Category.create!(name: "Category3")

3.times do |n|
  name  = "category#{n+1}"
  description = Faker::Lorem.sentence(2)
  Category.create!(name: name, description: description, parent_id: "1")
end

3.times do |n|
  name  = "category#{n+1}"
  description = Faker::Lorem.sentence(2)
  Category.create!(name: name, description: description, parent_id: "2")
end

cat = Category.order(:created_at).take(5)

1.times do |n|
  name  = "lesson"
  cat.each { |category| category.lessons.create!(name: name+"#{category.id}", number_questions: "20") }
end

lesson = Lesson.all
4.times do |n|
  content = Faker::Lorem.sentence(2)
  lesson.each { |less| less.questions.create!(content: content) }
end

question = Question.all
3.times do |n|
  content = "answer#{n+1}"
  question.each { |q| q.answers.create!(content: content) }
end
1.times do |n|
  content = "answer correct"
  is_correct = true
  question.each { |q| q.answers.create!(content: content, is_correct: is_correct) }
end
