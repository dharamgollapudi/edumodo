# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teacher = Teacher.find_or_create_by(email: "teacher@gmail.com") do |t|
  t.password =  'teacher',
  t.encrypted_password = Teacher.new.send(:password_digest, 'teacher')
end

Student.find_or_create_by(email: "student@gmail.com") do |s|
  t.password =  'student',
  t.encrypted_password = Student.new.send(:password_digest, 'student')
end

10.times do |i|
  Homework.create(
    teacher: teacher,
    title: "Homework Title #{i}",
    question: "Homework Question #{i}",
    due_on: Time.now + 7.days
  )
end
