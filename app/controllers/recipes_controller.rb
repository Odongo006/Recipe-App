class RecipesController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @ingredients = @recipe.recipe_foods.where(recipe: @recipe)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
>>>>>>> 75fc14ba8e57ee883426636f0a23b81c1ed3d20f
    end
  
    def show
      @recipe = Recipe.find_by(id: params[:id])
      @foods = @recipe.foods
    end
  
    def destroy
      @recipe = Recipe.find_by(id: params[:id])
      @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe successfully deleted.'
    end
  
    def toggle_public
      @recipe = Recipe.find(params[:id])
      @recipe.update(public: !@recipe.public)
      render json: { success: true }
    end
<<<<<<< HEAD
  
    private
  
    def recipe_params
      params.require(:recipe).permit(:public)
    end
  end
=======
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def food_params
    params.require(:food).permit(:name, :measurement, :price, :quantity, recipe_foods_attributes: [:quantity])
  end
end
>>>>>>> 75fc14ba8e57ee883426636f0a23b81c1ed3d20f
