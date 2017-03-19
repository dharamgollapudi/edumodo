require 'test_helper'

class SolutionsControllerAsTeacherTest < ActionController::TestCase
  self.controller_class = SolutionsController

  include Devise::Test::ControllerHelpers

  setup do
    @homework = homeworks(:homework_one)
    @solution = solutions(:one)
    @teacher = users(:teacher)
    sign_in(@teacher)
  end

  teardown do
    sign_out(@teacher)
  end

  test "should redirect to root_path with error while getting new solution" do
    get :new, homework_id: @homework.id

    assert_redirected_to root_path
    assert_equal 'You need to be Student to access that functionality', flash[:error]
  end

  test "should redirect to root_path with error while creating new solution" do
    post :create, homework_id: @homework.id, solution: { answer: @solution.answer }

    assert_redirected_to root_path
    assert_equal 'You need to be Student to access that functionality', flash[:error]
  end
end
