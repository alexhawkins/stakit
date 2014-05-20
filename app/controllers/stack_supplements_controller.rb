class StackSupplementsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  before_action :set_stack, except: [:sort]
  before_action :set_stack_supplement, only: [:show, :edit, :update, :destroy]
  
  # GET /stack_supplements
  # GET /stack_supplements.json
  def index
    @user = current_user
    @stack_supplements = @stack.stack_supplements.order("position")
    @new_stack_supplement = StackSupplement.new
    @new_stack = Stack.new
    @frequencies = Frequency.all
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
    @stack_supplement = @stack.stack_supplements.build(stack_supplement_params)
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
     else
       #otherwise, find the last stack that this user created and redirect
       @stack = current_user.stacks.find(:first, :order => 'created_at DESC')
       flash[:notice] = "Unable to view this page"
       redirect_to stack_stack_supplements_path(@stack)
     end
    end
end
