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
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    @answer = current_user.answers.build(answer_params)
    @answer.question = @question
    @new_answer = Answer.new

    respond_to do |format|
      if @answer.save
        format.html { redirect_to :back, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to :back, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
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
      params.require(:answer).permit(:user_id, :question_id, :body)
    end
end
