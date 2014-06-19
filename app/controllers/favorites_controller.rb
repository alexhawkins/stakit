class FavoritesController < ApplicationController

  def create
    @stack = Stack.find(params[:stack_id])
    favorite = current_user.favorites.build(stack: @stack)
    authorize favorite
    if favorite.save
      flash[:notice] = "Favorited Stack"
      redirect_to :back
    else
      flash[:error] = "Unable to add favorite. Please try again."
      redirect_to :back
    end  
  end

  def destroy
    stack = Stack.find(params[:stack_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite
    if favorite.destroy
      flash[:notice] = "Removed favorite."
      redirect_to :back
    else
      flash[:error] = "Unable to remove favorite. Please try again."
      redirect_to :back
    end
  end

end
