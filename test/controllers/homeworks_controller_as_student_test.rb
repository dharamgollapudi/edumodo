require 'test_helper'

class HomeworksControllerAsStudentTest < ActionController::TestCase
  self.controller_class = HomeworksController

  include Devise::Test::ControllerHelpers

  setup do
    @homework = homeworks(:homework_one)
    @student = users(:student)
    sign_in(@student)
  end

  teardown do
    sign_out(@student)
  end

  test "should get homeworks" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homeworks)
  end

  test "should redirect to root_path with error while getting new homework" do
    get :new
    assert_redirected_to root_path
    assert_equal 'You need to be Teacher to access that functionality', flash[:error]
  end

  test "should redirect to root_path with error while creating new homework" do
    post :create, homework: { due_on: @homework.due_on, question: @homework.question, teacher_id: @homework.teacher_id, title: @homework.title }

    assert_redirected_to root_path
    assert_equal 'You need to be Teacher to access that functionality', flash[:error]
  end

  test "should redirect to root_path with error while showing homework" do
    get :show, id: @homework

    assert_redirected_to root_path
    assert_equal 'You need to be Teacher to access that functionality', flash[:error]
  end

  test "should redirect to root_path with error while editing homework" do
    get :edit, id: @homework

    assert_redirected_to root_path
    assert_equal 'You need to be Teacher to access that functionality', flash[:error]
  end

  test "should redirect to root_path with error while updating homework" do
    patch :update, id: @homework, homework: { due_on: @homework.due_on, question: @homework.question, teacher_id: @homework.teacher_id, title: @homework.title }

    assert_redirected_to root_path
    assert_equal 'You need to be Teacher to access that functionality', flash[:error]
  end
end
