require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  should validate_presence_of(:homework)
  should validate_presence_of(:student)

end
