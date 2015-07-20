class Recipes < Sinatra::Base

# index
  get '/recipes' do
    @recipes = Recipe.all
    erb('recipes/index')
  end

# new
  get '/recipes/new' do
    @recipe = Recipe.new
    erb('recipes/index')
  end

# create
  post 'recipes/new' do
    @recipe = Recipe.create(params[:recipe])
    redirect('/recipes/#{@recipe.id}/show')
  end

# show
  get 'recipes/:id/show' do
    @recipe = Recipe.find(params[:id])
    erb('recipes/show')
  end

# edit
  get 'recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb('recipes/edit')
  end

# update
  post 'recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:id])
    redirect('/recipes/#{@recipe.id}/show')
  end

#destroy
  post 'recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect('/recipes')
  end
