class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  include DataReader

  # GET /uploads
  # GET /uploads.json
  def index
    if admin_logged_in?
      @uploads = Upload.all
    else
      redirect_to access_denied_url
    end

  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    if admin_logged_in?
    else
      redirect_to access_denied_url
    end
  end

  # GET /uploads/new
  def new
    if admin_logged_in?
      @upload = Upload.new
    else
      redirect_to access_denied_url
    end
  end

  # GET /uploads/1/edit
  def edit
    if admin_logged_in?
    else
      redirect_to access_denied_url
    end
  end

  # POST /uploads
  # POST /uploads.json
  def create
    if admin_logged_in?
      @upload = Upload.new(upload_params)

      respond_to do |format|
        if @upload.save
          format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
          format.json { render :show, status: :created, location: @upload }
          read_data(@upload.doc.path)
        else
          format.html { render :new }
          format.json { render json: @upload.errors, status: :unprocessable_entity }
        end
      end

    else
      redirect_to access_denied_url
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    if admin_logged_in?
      respond_to do |format|
        if @upload.update(upload_params)
          format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
          format.json { render :show, status: :ok, location: @upload }
        else
          format.html { render :edit }
          format.json { render json: @upload.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to access_denied_url
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    if admin_logged_in?
      @upload.destroy
      respond_to do |format|
        format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to access_denied_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_params
      params.require(:upload).permit(:doc)
    end
end
