class FavoriteStacksController < ApplicationController

  def create
    favorite = current_user.favorite_stacks.build
    if favorite.save
      flash[:notice] = "Favorited Stack"
      redirect_to :back
    else
      flash[:error] = "Unable to add favorite. Please try again."
      redirect_to :back
    end  
  end

  def destroy
  favorite = current_user.favorite_stacks.find(params[:id])

  if favorite.destroy
    flash[:notice] = "Removed favorite."
    redirect_to :back
  else
    flash[:error] = "Unable to remove favorite. Please try again."
    redirect_to :back
  end
end

end
