class SolutionsController < ApplicationController
  before_action :require_student
  before_action :load_homework

  def new
    @solution = current_user.solutions.build
    @solution.homework = @homework
  end

  def create
    @solution = current_user.solutions.build(solution_params)
    @solution.homework = @homework

    if @solution.save
      flash[:notice] = 'Your solution has been created'
      redirect_to homeworks_url
    else
      render :new
    end
  end

  private
  def load_homework
    @homework = current_user.homeworks.find(params[:homework_id])
  end

  def solution_params
    params.require(:solution).permit(:homework_id, :answer)
  end
end
