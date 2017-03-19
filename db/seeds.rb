# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teacher = Teacher.find_or_initialize_by(email: "teacher@gmail.com")
teacher.password =  'teacher',
teacher.encrypted_password = Teacher.new.send(:password_digest, 'teacher')
teacher.save

if Student.count < 10
  10.times do |i|
    email = (i == 0) ? "student@gmail.com" : "student#{i}@gmail.com"
    student = Student.find_or_initialize_by(email: email)
    student.password =  'student'
    student.encrypted_password = Student.new.send(:password_digest, 'student')
    student.save
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