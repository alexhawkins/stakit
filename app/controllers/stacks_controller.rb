class StacksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_stack, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /stacks
  # GET /stacks.json
  def index
    if current_user
      @stacks = current_user.stacks
      authorize @stacks
    else
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
    @stack = Stack.new(stack_params)
    @stack.user = current_user
    respond_to do |format|
      if @stack.save
        format.html { redirect_to stack_stack_supplements_path(@stack), notice: 'Stack was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stack }
      else
        format.html { render action: 'new' }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stacks/1
  # PATCH/PUT /stacks/1.json
  def update
    respond_to do |format|
      if @stack.update(stack_params)
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
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
    @stack.destroy
    respond_to do |format|
      format.html { redirect_to stacks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack
      @stack = Stack.find(params[:id])
      authorize @stack
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_params
      params.require(:stack).permit(:name, :description, :links, :supplement_ids, :user_id)
    end
end
