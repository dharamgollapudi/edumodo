FactoryGirl.define do
  sequence :teacher_email do |n|
    "teacher#{n}@example.com"
  end

  sequence :student_email do |n|
    "student#{n}@example.com"
  end

  factory :teacher, class: Teacher do
    email { generate(:teacher_email) }
    password 'teacher'
    encrypted_password Teacher.new.send(:password_digest, 'teacher')
  end

  factory :student, class: Student do
    email { generate(:student_email) }
    password 'student'
    encrypted_password Student.new.send(:password_digest, 'student')
  end
end