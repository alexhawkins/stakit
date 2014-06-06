class FollowQuestionsController < ApplicationController
    before_action :set_follow_question, only: [:create, :destroy]
    respond_to :html, :js

    def create
        follow = @user.follow_questions.build(question: @question)
        if follow.save
          track_activity follow
          respond_to do |format|
           format.html {
              flash[:notice] = "You are now following this question"
              redirect_to @question 
            }
            format.js
           end
        else
           flash[:error] = "Unable to follow. Please try again"
           redirect_to @question
        end
    end

    def destroy
      follow = @user.follow_questions.find(params[:id])
      if follow.destroy
        respond_to do |format|
         format.html {
            flash[:notice] = "You are no longger following this question"
            redirect_to @question 
          }
          format.js
         end
      else
         flash[:error] = "Unable to remove follow. Please try again"
         redirect_to @question
      end
    end

    private

    def set_follow_question
      @user = current_user
      @question = Question.find(params[:question_id])
    end
end
