class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json


  def show
    @user = User.find(params[:id])
    @stacks = @user.stacks
    @stack = @user.stacks.find(:first, :order => 'created_at DESC')
  end

  def update
    @user = current_user
    @stack = @user.stacks.find(:first, :order => 'created_at DESC')
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { 
          flash[:notice] = "Your account was successfully updated."
          redirect_to stack_stack_supplements_path(@stack)
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
    params.require(:user).permit(:name)
  end
end