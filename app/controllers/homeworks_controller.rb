class HomeworksController < ApplicationController
  before_filter :require_teacher, except: :index

  def index
    # TODO: limit with pagination
    @homeworks = current_user.homeworks.order(:id)
  end

  def new
    @homework = current_user.homeworks.build
    # TODO: limit with pagination
    @students = Student.all
  end

  def create
    @homework = current_user.homeworks.build(homework_params)

    if @homework.save
      flash[:notice] = 'Your homework has been created'
      redirect_to homeworks_path
    else
      render :new
    end
  end

  def show
    @homework = current_user.homeworks.find(params[:id])

    if params[:student_id].present? && Student.exists?(params[:student_id])
      @student = Student.find(params[:student_id])
      @solutions = @homework.solutions_for_student(@student)
    else
      @solutions = @homework.solutions_latest
    end
  end

  def edit
    @homework = current_user.homeworks.find(params[:id])
    # TODO: limit with pagination
    @students = Student.all
  end

  def update
    @homework = current_user.homeworks.find(params[:id])

    if @homework.update_attributes!(homework_params)
      flash[:notice] = 'Your homework has been updated'
      redirect_to homeworks_path
    else
      render :edit
    end
  end

  private
  def homework_params
    params.require(:homework).permit(:title, :question, :due_on, student_ids: [])
  end
end
