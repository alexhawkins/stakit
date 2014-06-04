class RelationshipsController < ApplicationController
  #before_action :signed_in_user

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    track_activity @user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    track_activity @user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end