class StackSupplementsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  before_action :set_stack, except: [:sort]
  before_action :set_stack_supplement, only: [:show, :edit, :update, :destroy]
  before_action :set_follow, only: [:index]
  # GET /stack_supplements
  # GET /stack_supplements.json
  def index
    @user = current_user
    @stack_supplements = @stack.stack_supplements.includes(:supplement).includes(:frequency)
    @new_stack_supplement = StackSupplement.new
    @new_stack = Stack.new
    @frequencies = Frequency.all.load
    @public = @stack.public
    @user_attachment = UserAttachment.new
    @following_activities = collect_activities @following
    @video = Video.new
  end

  # GET /stack_supplements/1
  # GET /stack_supplements/1.json
  def show
  end

  # GET /stack_supplements/new
  def new
    @stack_supplement = StackSupplement.new
  end

  # GET /stack_supplements/1/edit
  def edit

  end

  # POST /stack_supplements
  # POST /stack_supplements.json
  def create
    #prevent user form creating unlimited number of stack_supplements
    unless @stack.stack_supplements.count > 40
     @stack_supplement = @stack.stack_supplements.build(stack_supplement_params)
      #set initial stack dose to default stack dose/RDA
     @stack_supplement.dose = @stack_supplement.supplement.default_dose
    end
    @new_stack_supplement = StackSupplement.new

    respond_to do |format|
      if @stack_supplement.save
        format.html { redirect_to :back, notice: 'Stack supplement was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@stack, @stack_supplement] }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @stack_supplement.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /stack_supplements/1
  # PATCH/PUT /stack_supplements/1.json
  def update
    respond_to do |format|
      if @stack_supplement.update(stack_supplement_params)
        format.html { redirect_to [@stack, @stack_supplement], notice: 'Stack supplement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stack_supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stack_supplements/1
  # DELETE /stack_supplements/1.json
  def destroy
    @stack_supplement.destroy
    respond_to do |format|
      format.html { redirect_to stack_stack_supplements_url(@stack) }
      format.json { head :no_content }
      format.js
    end
  end

  def sort
      params[:stack_supplement].each_with_index do |id, index| 
        StackSupplement.where(id: id).update_all({position: index+1})
      end
      render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_stack_supplement
      @stack_supplement = StackSupplement.find(params[:id])
      authorize @stack_supplement
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_supplement_params
      params.require(:stack_supplement).permit(:stack_id, :supplement_name, :supplement_ids, :supplement_id, :frequency_id, :dose)
    end

    def set_stack
      #check to see if the user has a stack that is the same as the stack being passed 
      if current_user.stacks.where(id: params[:stack_id]).present? 
       #@stack = current_user.stacks.where(user_id: current_user.id).find(:first, :order => 'created_at DESC')
       #if a stack exist, set the stack variabe
       @stack = Stack.find(params[:stack_id])
       authorize @stack
     else #CREATE A REDIRECT
       #otherwise, find the last stack that this user created and redirect
       @stack = current_user.stacks.first
       flash[:error] = "There was error processing your request"
       redirect_to stack_stack_supplements_path(@stack)
     end
    end

    def set_follow
      #show the first 20 following and followed only
      @followers = current_user.followers.limit(20)
      @following = current_user.followed_users.limit(20)
    end


    #get all the user and followed user activities 
    def collect_activities(following)
      unless following.nil?
        activities_array = following.collect(&:activities).flatten.sort { |x,y| y.created_at <=> x.created_at }[0..30]
      end
      #if current_user.activities.any?
        #current_user.activities.each do |activity|
      #    activities_array << activity
      #  end
     # end
      #limit(10)
       #activities_array.sort { |x,y| y.created_at <=> x.created_at }.paginate(page: params[:page], per_page: 10)
    end
end
