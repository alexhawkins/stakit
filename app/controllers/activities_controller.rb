class ActivitiesController < ApplicationController
  respond_to :html, :js

  def index
    @activities = Activity.includes(:user).includes(:trackable).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
        format.html
        format.json { head :no_content }
        format.js
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:user_id, :action, :trackable)
    end
end
