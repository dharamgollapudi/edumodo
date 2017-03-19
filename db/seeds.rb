# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teacher = Teacher.find_by_email("teacher@gmail.com")
unless teacher.present?
  teacher = Teacher.new
  teacher.email = "teacher@gmail.com"
  teacher.password =  'teacher'
  teacher.password_confirmation = 'teacher'
  teacher.save
end

if Student.count < 10
  10.times do |i|
    email = (i == 0) ? "student@gmail.com" : "student#{i}@gmail.com"
    student = Student.find_by_email(email)
    unless student.present?
      student = Student.new
      student.email = email
      student.password =  'student'
      student.password_confirmation = 'student'
      student.save
    end
  end
end

if Homework.count < 10
  10.times do |i|
    Homework.create(
      teacher: teacher,
      title: "Homework Title #{i}",
      question: "Homework Question #{i}",
      due_on: Time.now + 7.days
    )
  end
end

10.times do |i|
  homework = Homework.order("RANDOM()").limit(1).first
  student = Student.order("RANDOM()").limit(1).first

  Assignment.find_or_create_by(
    homework: homework,
    student: student
  )
end