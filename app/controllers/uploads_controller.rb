require 'upload_parser'

class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
  end

  # POST /uploads
  def create
    tsv_string = upload_params ? upload_params.read : nil
    upload_parser = UploadParser.new(tsv_string)

    if upload_parser.parse
      redirect_to upload_parser.upload, notice: 'Items were successfully uploaded.'
    else
      render :new
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params[:upload_file]
    end
end
