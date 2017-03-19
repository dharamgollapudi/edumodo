# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.create(
  email: "teacher@gmail.com",
  password: 'teacher',
  encrypted_password: Teacher.new.send(:password_digest, 'teacher')
)

Student.create(
  email: "student@gmail.com",
  password: 'student',
  encrypted_password: Student.new.send(:password_digest, 'student')
)
