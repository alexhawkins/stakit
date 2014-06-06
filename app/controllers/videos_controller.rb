class VideosController < ApplicationController

  before_action :set_video, only: [:create, :destroy]

  def create
    unless @user.videos.count > 5
      @video = @user.videos.build(video_params)
      if @video.save
        track_activity @video
        respond_to do |format|
          format.html { redirect_to :back }
          format.js
        end
      end
    end
  end

  def destroy
    @video = @user.videos.find(params[:id])
    @video.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private

  def set_video
    @user = current_user
  end

  def video_params
      params.require(:video).permit(:user_id, :link)
  end
end
