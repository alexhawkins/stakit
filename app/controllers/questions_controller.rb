class QuestionsController < ApplicationController
  respond_to :html, :js
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.text_search(params[:query]).paginate(page: params[:page], per_page: 5)
    #includes(:user).includes(:answers).includes(:follow_questions).paginate(page: params[:page], per_page: 5)
    @new_question = Question.new
    @new_answer = Answer.new
    respond_to do |format|
        format.html
        format.json { head :no_content }
        format.js
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @related_questions = collect_related_questions @topics
    @stack = current_user.stacks.where(default: true).first
    get_and_show_answers
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    respond_with(@question) do |format|
      format.html { redirect_to [@question]}
      format.js
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @user = current_user
    @question = @user.questions.build(question_params)
    @question.save!
    @topic_id = params[:topic_id]
    @new_question = Question.new(user_id: @user)
    if @topic_id.present?
      @question_topic = QuestionTopic.new(question_id: @question.id, topic_id: @topic_id)
      @question_topic.save
    end

    respond_to do |format|
      if @question.save
        track_activity @question
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
      if @question.update(question_params)
        track_activity @question
        respond_with(@question) do |format|
          format.html { redirect_to @question, notice: 'Question was successfully updated.' }
          format.json { head :no_content }
          format.js
        end
      else
        respond_with(@question) do |format|
          format.html { render action: 'edit' }
          format.json { render json: @question.errors, status: :unprocessable_entity }
          format.js
        end
      end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
      @topics = @question.topics
    end

    def get_and_show_answers
      @answers = @question.answers.includes(:user).includes(:answer_votes).paginate(page: params[:page], per_page: 5)
      @answer = Answer.new
      respond_to do |format|
        format.html
        #add so for use with x-editable
        format.json { head :no_content }
        format.js
       end
    end

    def collect_related_questions(topics)
      unless topics.nil?
        question_array = topics.collect(&:questions).flatten.uniq.sort { |x,y| y.created_at <=> x.created_at }[0..15]
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    # Because it is receiving an array of scalar values instead of just a scalar value, we
    # need to add { } around :topic_ids => []
    def question_params
      params.require(:question).permit(:name, :topic_tokens, { :topic_ids => [] }, :description, :user_id)
    end
end
