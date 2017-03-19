class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate_user!

  private
  def require_teacher
    unless current_user.is_a?(Teacher)
      flash[:error] = 'You need to be Teacher to access that functionality'
      redirect_to root_url
    end
  end
end
