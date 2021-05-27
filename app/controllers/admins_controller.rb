class AdminsController < ApplicationController
  def login
  end

  # POST /admins
  # POST /admins.json
  def create
    admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end
  # def viewer
  #   if @password[:password] == "password"
  #     flash[:success] = "You have been logged in"
  #     redirect_to students_url
  #   else
  #     flash[:danger] = 'Invalid password'
  #     render 'login'
  #   end 
  # end

  def upload
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def download_sample
    send_file("#{Rails.root}/app/assets/sample.xls", filename: "class_sample.xls")
  end

  private

  # Only allow a list of trusted parameters through.
  def admin_params
    params.require(:admin).permit(:email,:password)
  end

end
