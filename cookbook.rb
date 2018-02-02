require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_from_csv if File.exist?(csv_file)
  end

  def add_recipe(name)
    @recipes << name
    store_in_csv
  end

  def load_from_csv
    CSV.foreach(@csv_file) do |row|
      name = row[0]
      description = row[1]
      @recipes << Recipe.new(name, description)
    end
  end

  def store_in_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |object|
        csv << [object.name, object.description]
      end
    end
  end

  def all
    @recipes
  end

  def create(index)
    @recipes[index]
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    store_in_csv
  end
end
