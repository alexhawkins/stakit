class UserAttachmentsController < ApplicationController
  before_action :set_user_attachment, only: [:show, :edit, :update, :destroy]

  # GET /user_attachments
  # GET /user_attachments.json
  def index
    @user_attachments = UserAttachment.all
  end

  # GET /user_attachments/1
  # GET /user_attachments/1.json
  def show
  end

  # GET /user_attachments/new
  def new
    @user = current_user
    @user_attachment = UserAttachment.new
  end

  # GET /user_attachments/1/edit
  def edit
  end

  # POST /user_attachments
  # POST /user_attachments.json
  def create
    @user = current_user
    @user_attachments = @user.user_attachments
    @user_attachment = @user.user_attachments.build(user_attachment_params)
    @new_user_attachment = UserAttachment.new
    
    if (@user_attachments.count < 8)
      respond_to do |format|
         if @user_attachment.save 
          track_activity @user_attachment
          format.html { 
            flash[:notice] = 'Your image was successfully uploaded.'
            redirect_to :back 
          }
           format.json { render action: 'show', status: :created, location: @user_attachment }
         else
           format.html { 
              flash[:error] = "There was an error uploading the image."
              render action: 'new' 
            }
           format.json { render json: @user_attachment.errors, status: :unprocessable_entity }
         end
      end
    else
       respond_to do |format|
          format.html {
            flash[:error] = 'There was an error uploading the image. 8 image max.'
            redirect_to :back 
          }
       end
    end
  end

  # PATCH/PUT /user_attachments/1
  # PATCH/PUT /user_attachments/1.json
  def update
    respond_to do |format|
      if @user_attachment.update(user_attachment_params)
        format.html { redirect_to @user_attachment, notice: 'User attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_attachments/1
  # DELETE /user_attachments/1.json
  def destroy
    @user_attachment.destroy
    track_activity @user_attachment
    respond_to do |format|
      format.html { 
        flash[:notice] = 'Your image was successfully deleted.'
        redirect_to :back
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_attachment
      @user_attachment = UserAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_attachment_params
      params.require(:user_attachment).permit(:user_id, :image)
    end
end
