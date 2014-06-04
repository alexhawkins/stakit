class ActivitiesController < ApplicationController

  def index
    @activities = Activity.order("created_at DESC")
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:user_id, :action, :trackable)
    end
end
