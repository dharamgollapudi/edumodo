require 'test_helper'

class SolutionsControllerAsStudentTest < ActionController::TestCase
  self.controller_class = SolutionsController

  include Devise::Test::ControllerHelpers

  setup do
    @homework = homeworks(:homework_one)
    @solution = solutions(:one)
    @student = users(:student)
    sign_in(@student)
  end

  teardown do
    sign_out(@student)
  end

  test "should get new solution" do
    get :new, homework_id: @homework.id

    assert_response :success
    assert_not_nil assigns(:solution)
  end

  test "should create solution" do
    assert_difference('Solution.count') do
      post :create, homework_id: @homework.id, solution: { answer: @solution.answer }
    end

    assert_redirected_to homeworks_path
    assert_equal 'Your solution has been created', flash[:notice]
  end
end
