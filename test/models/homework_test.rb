require 'test_helper'

class HomeworkTest < ActiveSupport::TestCase
  should validate_presence_of(:teacher)
  should validate_presence_of(:title)
  should validate_presence_of(:question)
  should validate_presence_of(:due_on)

end
