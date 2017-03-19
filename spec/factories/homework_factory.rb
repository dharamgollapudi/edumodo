FactoryGirl.define do
  factory :homework, class: Homework do
    title 'MyString'
    question 'MyText'
    due_on Time.now + 7.days
  end
end