require 'test_helper'

class HomeworksControllerAsTeacherTest < ActionController::TestCase
  self.controller_class = HomeworksController

  include Devise::Test::ControllerHelpers

  setup do
    @homework = homeworks(:homework_one)
    @teacher = users(:teacher)
    sign_in(@teacher)
  end

  teardown do
    sign_out(@teacher)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homeworks)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:homework)
    assert_not_nil assigns(:students)
  end

  test "should create homework" do
    assert_difference('Homework.count') do
      post :create, homework: { due_on: @homework.due_on, question: @homework.question, teacher_id: @homework.teacher_id, title: @homework.title }
    end

    assert_redirected_to homeworks_path
    assert_equal 'Your homework has been created', flash[:notice]
  end

  test "should show homework" do
    get :show, id: @homework
    assert_response :success
    assert_not_nil assigns(:solutions)
  end

  test "should get edit" do
    get :edit, id: @homework
    assert_response :success
    assert_not_nil assigns(:homework)
    assert_not_nil assigns(:students)
  end

  test "should update homework" do
    patch :update, id: @homework, homework: { due_on: @homework.due_on, question: @homework.question, teacher_id: @homework.teacher_id, title: @homework.title }
    assert_redirected_to homeworks_path
    assert_equal 'Your homework has been updated', flash[:notice]
  end
end
