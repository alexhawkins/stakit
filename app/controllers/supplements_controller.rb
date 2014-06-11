class SupplementsController < ApplicationController
  before_action :set_supplement, only: [:show, :edit, :update, :destroy]

  # GET /supplements
  # GET /supplements.json
  def index
    #get all supplements where the name is like the auto complete query
    #and match it to the term parameter in jquery-ui
    #order the supplments by name
      @supplements = Supplement.order(:name).where("name like ?", "%#{params[:term]}%")
      #return a json array of the supplements
      render json: @supplements.map(&:name)
    #authorize @supplements
  end

  # GET /supplements/1
  # GET /supplements/1.json
  def show
  end

  # GET /supplements/new
  def new
    @supplement = Supplement.new
    authorize @supplement
  end

  # GET /supplements/1/edit
  def edit
  end

  # POST /supplements
  # POST /supplements.json
  def create
    @supplement = Supplement.new(supplement_params)
    authorize @supplement

    respond_to do |format|
      if @supplement.save
        format.html { redirect_to new_supplement_path, notice: 'Supplement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supplement }
      else
        format.html { render action: 'new' }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplements/1
  # PATCH/PUT /supplements/1.json
  def update
    respond_to do |format|
      if @supplement.update(supplement_params)
        format.html { redirect_to @supplement, notice: 'Supplement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplements/1
  # DELETE /supplements/1.json
  def destroy
    @supplement.destroy
    respond_to do |format|
      format.html { redirect_to supplements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplement
      @supplement = Supplement.find(params[:id])
      authorize @supplement
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplement_params
      params.require(:supplement).permit(:name, :tooltip, :default_dose, :default_frequency)
    end
end
