class StackSupplementsController < ApplicationController
  before_action :set_stack
  before_action :set_stack_supplement, only: [:show, :edit, :update, :destroy]

  # GET /stack_supplements
  # GET /stack_supplements.json
  def index
    @stack_supplements = @stack.stack_supplements
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

    respond_to do |format|
      if @stack_supplement.save
        format.html { redirect_to [@stack, @stack_supplement], notice: 'Stack supplement was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@stack, @stack_supplement] }
      else
        format.html { render action: 'new' }
        format.json { render json: @stack_supplement.errors, status: :unprocessable_entity }
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
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack_supplement
      @stack_supplement = StackSupplement.find(params[:id])
      authorize @stack_supplement
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_supplement_params
      params.require(:stack_supplement).permit(:stack_id, :supplement_id, :frequency_id, :dose)
    end

    def set_stack
      @stack = Stack.find(params[:stack_id])
      authorize @stack
    end
end
