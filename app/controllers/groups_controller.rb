class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    if admin_logged_in?
      @groups = Group.all.sort_by {|group| group.name.downcase}
    else
      redirect_to access_denied_url
    end

  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    if admin_logged_in? || current_student.group_id == params[:id].to_i
    else
      redirect_to access_denied_url
    end
  end

  # GET /groups/new
  def new
    if admin_logged_in?
      @group = Group.new
    else
      redirect_to access_denied_url
    end
  end

  # GET /groups/1/edit
  def edit
    if admin_logged_in?
    else
      redirect_to access_denied_url
    end
  end

  # POST /groups
  # POST /groups.json
  def create
    if admin_logged_in?
      @group = Group.new(group_params)

      respond_to do |format|
        if @group.save
          format.html { redirect_to @group, notice: 'Group was successfully created.' }
          format.json { render :show, status: :created, location: @group }
        else
          format.html { render :new }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to access_denied_url
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    if admin_logged_in?
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to @group, notice: 'Group was successfully updated.' }
          format.json { render :show, status: :ok, location: @group }
        else
          format.html { render :edit }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to access_denied_url
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    if admin_logged_in?
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to access_denied_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name)
    end
end
