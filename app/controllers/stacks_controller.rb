class StacksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_stack, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  # GET /stacks
  # GET /stacks.json
  def index
    if current_user
      @user = current_user
      @stacks = current_user.stacks
      authorize @stacks
      #set up stack for user to go back to when he click 'back'
      @default_stack = current_user.stacks.where(default: true).first
    else
      flash[:notice] = "You can not view this page."
      redirect_to new_user_session_path
    end
  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
    @user = current_user
  end

  # GET /stacks/new
  def new
    @stack = Stack.new
    authorize @stack
  end

  # GET /stacks/1/edit
  def edit
  end

  # POST /stacks
  # POST /stacks.json
  def create
    unless current_user.stacks.count > 20
      @stack = Stack.new(stack_params)
      @stack.user = current_user
      respond_to do |format|
        if @stack.save
          track_activity @stack
          format.html { redirect_to stack_stack_supplements_path(@stack), notice: 'Stack was successfully created.' }
          format.json { render action: 'show', status: :created, location: @stack }
        else
          format.html { render action: 'new' }
          format.json { render json: @stack.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end
  end

  # PATCH/PUT /stacks/1
  # PATCH/PUT /stacks/1.json
  def update
    respond_to do |format|
      if @stack.update(stack_params)
        format.html { 
        redirect_to :back, notice: 'Stack was successfully updated.' }
        format.json { respond_with_bip(@stack) }
      else
        format.html { render action: 'edit' }
        format.json { respond_with_bip(@stack) }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    #maker sure each user has at least 1 stack and that we're not deleting the default
    unless @stack.default? || current_user.stacks.count <= 1
      @stack.destroy
      respond_to do |format|
        format.html { redirect_to stacks_url }
        format.json { head :no_content }
        format.js
      end
    else
      #redirect user to his only remaining stack when he tries to delete it
      flash[:error] = "You must have at least one stack. Default stacks cannot be deleted."
      @stack = current_user.stacks.first
      redirect_to stack_stack_supplements_path(@stack)
    end
  end

  #SET THE DEFAULT STACK
  def default_stack
    @default_stack = Stack.find(params[:id])
    @current_default = current_user.stacks.where(default: true).first
    @default_stack.update_attribute(:default, true)
    if @current_default.present?
      @current_default.update_attribute(:default, false)
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack
      @stack = Stack.find(params[:id])
      authorize @stack
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_params
      params.require(:stack).permit(:name, :public, :default, :description, :links, :supplement_ids, :user_id)
    end
end
