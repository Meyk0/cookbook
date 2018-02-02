require_relative "controller"

class View
  def ask_user_for_name
    puts "Please enter the name of the recipe"
    name = gets.chomp
    return name
  end

  def ask_user_for_description
    puts "Please enter the description of the recipe"
    description = gets.chomp
    return description
  end
end
