class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    if admin_logged_in?
      @students = Student.all.sort_by {|student| [student.group.name.downcase, student.name.downcase]}
    else
      redirect_to access_denied_url
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    if admin_logged_in?
      @student = Student.find(params[:id])
    else
      redirect_to access_denied_url
    end
  end

  # GET /students/new
  def new
    if admin_logged_in?
      @student = Student.new
    else
      redirect_to access_denied_url
    end
  end

  # GET /students/1/edit
  def edit
    if !admin_logged_in?
      redirect_to access_denied_url
    end
  end

  # POST /students
  # POST /students.json
  def create
    if admin_logged_in?
      @student = Student.new(student_params)

      respond_to do |format|
        if @student.save
          format.html { redirect_to @student, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
          g = Group.find_by(id: student_params["group_id"])
          g.students << @student
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to access_denied_url
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if admin_logged_in?
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to @student, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to access_denied_url
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    if admin_logged_in?
      @student.destroy
      respond_to do |format|
        format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to access_denied_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :password, :group_name).merge(:group_id => Group.find_by(name: params.require(:student).permit(:name, :email, :password, :group_name)["group_name"])&.id)
    end
end
