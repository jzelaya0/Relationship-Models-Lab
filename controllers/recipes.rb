class Recipes < Sinatra::Base

  get '/recipes' do
    @recipes = Recipe.all

    erb('views/recipes/index')
  end
