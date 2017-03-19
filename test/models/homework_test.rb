require 'test_helper'

class HomeworkTest < ActiveSupport::TestCase
  should validate_presence_of(:teacher)
  should validate_presence_of(:title)
  should validate_presence_of(:question)
  should validate_presence_of(:due_on)

  test 'should return true if due_on is in the future' do
    @homework = homeworks(:homework_one)
    @homework.due_on = Time.now + 7.days
    @homework.save

    assert @homework.can_be_solved?
  end

  test 'should return false if due_on is in the future' do
    @homework = homeworks(:homework_one)
    @homework.due_on = Time.now - 7.days
    @homework.save

    assert_not @homework.can_be_solved?
  end
end
