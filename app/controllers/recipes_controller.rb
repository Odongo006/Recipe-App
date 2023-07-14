class RecipesController < ApplicationController
<<<<<<< HEAD
  # load_and_authorize_resource

=======
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
>>>>>>> dev
  def index
    @recipes = Recipe.all
  end

<<<<<<< HEAD
  def show
    @recipe = Recipe.find_by(id: params[:id])
    @foods = @recipe.foods
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe successfully deleted.'
=======
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
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
    @recipe_food = @food.recipe_foods.build
  end

  def create_ingredient
    @current_user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = @current_user.foods.build(food_params.except(:recipe_foods_attributes))

    puts @food.inspect
    if @food.save
      @recipe_food = @food.recipe_foods.build(recipe: @recipe,
                                              quantity: food_params[:recipe_foods_attributes]['0'][:quantity])

      if @recipe_food.save
        redirect_to recipe_path(@recipe), notice: 'Your Recipe is created successfully'
      else
        flash[:alert] = 'Something went wrong, try again!!'
        puts @recipe_food.errors.full_messages
        render :new_ingredient
      end
    else
      flash[:alert] = 'Something went wrong, try again!!'
      puts @food.errors.full_messages
      render :new_ingredient
    end
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
>>>>>>> dev
  end
end
