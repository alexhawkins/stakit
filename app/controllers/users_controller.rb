class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def update
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
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