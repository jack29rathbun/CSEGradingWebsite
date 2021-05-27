class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    ## change to admin
    if admin_logged_in?
      @evaluations = Evaluation.all.sort_by {|evaluation| evaluation.evaluator.downcase}
    elsif student_logged_in?
      @evaluations = Evaluation.all.select{|eval| eval.evaluator == current_student.name}.sort_by {|evaluation| [evaluation.project, evaluation.evaluator.downcase, evaluation.evaluatee.downcase]}
    else
      redirect_to access_denied_url
    end
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
    if student_logged_in? && @evaluation.evaluator == current_student.name
    else
      redirect_to access_denied_url
    end
  end

  # GET /evaluations/new
  def new
    if student_logged_in?
      @evaluation = Evaluation.new
    else
      redirect_to access_denied_url
    end
  end

  # GET /evaluations/1/edit
  def edit
    if student_logged_in? && @evaluation.evaluator == current_student.name
    else
      redirect_to access_denied_url
    end
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    if student_logged_in?
      @evaluation = Evaluation.new(evaluation_params)
      respond_to do |format|
        if @evaluation.save
          format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
          format.json { render :show, status: :created, location: @evaluation }
          s = evaluation_params[:student]
          s.evaluations << @evaluation
        else
          format.html { render :new }
          format.json { render json: @evaluation.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to access_denied_url
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    if student_logged_in? && @evaluation.evaluator == current_student.name
      respond_to do |format|
        if @evaluation.update(evaluation_params)
          format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
          format.json { render :show, status: :ok, location: @evaluation }
        else
          format.html { render :edit }
          format.json { render json: @evaluation.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to access_denied_url
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    if student_logged_in? && @evaluation.evaluator == current_student.name
      @evaluation.destroy
      respond_to do |format|
        format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to access_denied_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(:evaluator, :evaluatee, :project, :score, :comments).merge(:student => current_student).merge(:group => Group.find_by(id: current_student.group_id))
    end
end
