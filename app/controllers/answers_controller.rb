class AnswersController < ApplicationController
  respond_to :html, :js
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers/1
  # GET /answers/1.json

  def show
    @question = Question.find(params[:question_id])
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
 def edit
    @question = Question.find(params[:question_id])
    respond_to do |format|
      format.html { redirect_to [@question]}
      format.js
    end
  end


  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])
    @new_answer = Answer.new
    #prevent user from answer same question twice
    @answers = @question.answers
    @answer = current_user.answers.build(answer_params)
    @answer.question = @question
    respond_to do |format|
      if @answer.save
        #create an Activity when we create an answer!
        track_activity @answer
        format.html { redirect_to question_path(@question,  anchor: "answer-#{@answer.id}"), notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
        format.js
      else
        format.html { 
          flash[:error] = 'There was a problem creating your answer.'
          redirect_to :back 
        }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    @question = Question.find(params[:question_id])
    respond_to do |format|
      if @answer.update(answer_params)
        track_activity @answer
        format.html { redirect_to :back, notice: 'Answer was successfully updated.' }
        format.json { respond_with_bip(@answer) }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @new_answer = Answer.new
    @question = Question.find(params[:question_id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:user_id, :question_id, :body, :bootsy_image_gallery_id)
    end
end
