class TopicsController < ApplicationController
  respond_to :html, :js
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.order(:name).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.json { render json: @topics.tokens(params[:q]) }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @questions = @topic.questions.includes(:user).includes(:answers).includes(:follow_questions).paginate(page: params[:page], per_page: 5)
    @related_topics = @topic.questions.collect(&:topics).flatten.uniq.sort { |x,y| y.questions.count <=> x.questions.count }[0..10]
    @new_question = Question.new
    @new_answer = Answer.new
    respond_to do |format|
        format.html
        format.json { head :no_content }
        format.js
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :description)
    end
end
