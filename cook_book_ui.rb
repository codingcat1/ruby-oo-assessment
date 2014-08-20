require './lib/meal'
require './lib/ingredient'

@new_meal


def main_menu
  loop do
    puts "*** COOK BOOK ***"
    puts "Press 'm' to create a new meal in the Cook Book."
    puts "Press 'l' to list all meals"
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'm'
      create_meal
    elsif main_choice == 'l'
      list_meals
    elsif main_choice == 'x'
      puts "***THANK YOU, COME AGAIN LATER***\n\n"
      sleep(1.5)
      system 'clear'
      exit
    else
      puts "Not a valid entry.  Please try again."
      sleep(1.5)
      system 'clear'
    end
  end
end

def create_meal
  puts "*** NEW MEAL ***"
  puts "Please enter the name of your meal:"
  meal_input = gets.chomp
  @new_meal = Meal.new(meal_input)
  @new_meal.save
  puts "* #{@new_meal.name} * has been saved in your recipe book.\n\n"
  sleep(1)
end

def list_meals
  puts "*** Here is a list of the meals you have created so far: ***"
  Meal.all.each_with_index do |new_meal, index|
    puts "#{index+1}. #{new_meal.name}\n\n"
    @meal_number = "#{index+1}"
  end
  loop do
    puts "Type the number of a meal to add ingredients"
    puts "Press 'x' to return to the main menu"
    list_meal = gets.chomp
    if list_meal == @meal_number
      add_ingredient
    elsif list_meal == 'x'
      main_menu
    else
      puts "Not a valid entry"
    end
  end
end

def add_ingredient
  puts "Enter your ingredients below: "
  ingredient_input = gets.chomp
  @new_ingredient = Ingredient.new(ingredient_input)
  @new_meal.add_ingredient(@new_ingredient)
  puts "* #{@new_ingredient.name} * has been added to the recipe for #{@new_meal.name}."
end




main_menu
