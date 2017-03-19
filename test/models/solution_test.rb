require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  should validate_presence_of(:student)
  should validate_presence_of(:homework)
  should validate_presence_of(:answer)

  #TODO: Add tests for set_version
end
