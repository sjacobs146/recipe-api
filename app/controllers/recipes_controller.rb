# frozen_string_literal: true

class RecipesController < ProtectedController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = current_user.recipes.all

    render json: @recipes
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    puts @recipe.name
    @recipe.destroy

    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = current_user.recipes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:id, :name, :serves, :category, :ingredients, :directions)
    end
end
