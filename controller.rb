require_relative "recipe"
require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
  end

  def create
    @view.ask_user_for_description
    recipe = Recipe.new
    @cookbook.add(recipe)
  end

  def list
    @cookbook.list
    @view.display_recipes(recipes)
  end

  def destroy
    list
    index = @view.ask_user_which_recipe_delete("delete")
    @cookbook.destroy(index)
  end
end
