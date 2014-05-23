class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json


  def show
    @user = User.find(params[:id])
    @stacks = @user.stacks
    @stack = @user.stacks.find(:first, :order => 'created_at DESC')
    @user_attachments = @user.user_attachments.all
  end

  def new
    @user = User.new
    @user_attachment = @user.user_attachments.build
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
     if @user.save
       params[:user_attachments]['image'].each do |image|
          @user_attachment = @user.user_attachments.create!(:image => image, :user_id => @user.id)
       end
       format.html { redirect_to @user, notice: 'User was successfully created.' }
     else
       format.html { render action: 'new' }
     end
   end

  end


  def update
    @user = current_user
    @user_attachment = @user.user_attachments.build
    @stack = @user.stacks.find(:first, :order => 'created_at DESC')
    respond_to do |format|
      if @user.update_attributes(user_params)
        params[:user_attachments]['image'].each do |image|
          @user_attachment = @user.user_attachments.create!(:image => image, :user_id => @user.id)
        end
        format.html { 
          flash[:notice] = "Your account was successfully updated."
          redirect_to edit_user_registration_path(@user)
        }
        format.json { respond_with_bip(@user) }
      else
        format.html { render "devise/registrations/edit" }
        format.json { respond_with_bip(@user) }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :location, user_attachments_attributes: [:id, :user_id, :image] )
  end
end