class QuestionTopicsController < ApplicationController
  before_action :set_question_topic, only: [:show, :edit, :update, :destroy]

  # GET /question_topics
  # GET /question_topics.json
  def index
    @question_topics = QuestionTopic.all.load
  end

  # GET /question_topics/1
  # GET /question_topics/1.json
  def show
  end

  # GET /question_topics/new
  def new
    @question_topic = QuestionTopic.new
  end

  # GET /question_topics/1/edit
  def edit
  end

  # POST /question_topics
  # POST /question_topics.json
  def create
    @question_topic = QuestionTopic.new(question_topic_params)

    respond_to do |format|
      if @question_topic.save
        format.html { redirect_to @question_topic, notice: 'Question topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question_topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_topics/1
  # PATCH/PUT /question_topics/1.json
  def update
    respond_to do |format|
      if @question_topic.update(question_topic_params)
        format.html { redirect_to @question_topic, notice: 'Question topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_topics/1
  # DELETE /question_topics/1.json
  def destroy
    @question_topic.destroy
    respond_to do |format|
      format.html { redirect_to question_topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_topic
      @question_topic = QuestionTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_topic_params
      params.require(:question_topic).permit(:topic_id, :topic_ids, :question_id)
    end
end
