class FruitsController < ApplicationController
  before_action :set_fruit, only: [:show, :edit, :update, :destroy]


# get /fruits/search 
  def search
  end

  #post /fruits/search
  def list
    puts "*************"
    puts params

    organic_val=false
    if params[:organic]=="true"
        organic_val = true
    end

    if params[:and_or]=="AND"
        @fruits = Fruit.where(species: params[:species], organic: organic_val)
    else
        @fruits = Fruit.arel_table
        species_fruits = @fruits[:species].eq(params[:species])
        organic_fruits = @fruits[:organic].eq(organic_val)
        @fruits = Fruit.where(species_fruits.or(organic_fruits))
    end
  end

  # GET /fruits
  # GET /fruits.json

  def index
    @fruits = Fruit.all
  end

  # GET /fruits/1
  # GET /fruits/1.json
  def show
  end

  # GET /fruits/new
  def new
    @fruit = Fruit.new
  end

  # GET /fruits/1/edit
  def edit
  end

  # POST /fruits
  # POST /fruits.json
  def create
    @fruit = Fruit.new(fruit_params)

    respond_to do |format|
      if @fruit.save
        format.html { redirect_to @fruit, notice: 'Fruit was successfully created.' }
        format.json { render :show, status: :created, location: @fruit }
      else
        format.html { render :new }
        format.json { render json: @fruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fruits/1
  # PATCH/PUT /fruits/1.json
  def update
    respond_to do |format|
      if @fruit.update(fruit_params)
        format.html { redirect_to @fruit, notice: 'Fruit was successfully updated.' }
        format.json { render :show, status: :ok, location: @fruit }
      else
        format.html { render :edit }
        format.json { render json: @fruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fruits/1
  # DELETE /fruits/1.json
  def destroy
    @fruit.destroy
    respond_to do |format|
      format.html { redirect_to fruits_url, notice: 'Fruit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fruit
      @fruit = Fruit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fruit_params
      params.require(:fruit).permit(:species, :organic)
    end
end
