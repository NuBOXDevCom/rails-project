class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html {redirect_to @recipe, notice: 'Recette crée avec succès'}
        format.json {render :show, status: :created, location: @recipe}
      else
        format.html {render :new}
        format.json {render json: @recipe.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /recipes/1
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html {redirect_to @recipe, notice: 'Recette mis à jour avec succès'}
        format.json {render :show, status: :ok, location: @recipe}
      else
        format.html {render :edit}
        format.json {render json: @recipe.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html {redirect_to recipes_url, success: 'Recette supprimée avec succès'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:nb_persons, :preparation_time, :cooking_time, :ingredients, :category_id, :preparation, :name)
  end
end
