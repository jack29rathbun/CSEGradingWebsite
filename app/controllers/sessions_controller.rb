class SessionsController < ApplicationController
  def new
  end

  def access_denied
  end

  def home
    if admin_logged_in?
      redirect_to students_url
    elsif student_logged_in?
      redirect_to new_evaluation_url
    else
    end
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    student = Student.find_by(email: params[:session][:email].downcase)
    if student&.authenticate(params[:session][:password])
      flash[:success] = "You have been logged in"
      student_log_in student
      redirect_to new_evaluation_url
    elsif admin&.authenticate(params[:session][:password])
      flash[:success] = "You have been logged in"
      admin_log_in admin
      redirect_to students_url
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
