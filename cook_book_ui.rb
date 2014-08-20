require './lib/meal'
require './lib/ingredient'

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
  new_meal = Meal.new(meal_input)
  new_meal.save
  puts "* #{new_meal.name} * has been saved in your recipe book.\n\n"
  sleep(1)
end

def list_meals
  puts "*** Here is a list of the meals you have created so far: ***"
  Meal.all.each_with_index do |meal, index|
    puts "#{index+1}. #{meal.name}\n\n"
  end
  puts "Type the number of a meal to add or view ingredients"
  puts "Press 'x' to return to the main menu"
  list_meal = gets.chomp
  if list_meal == 'x'
    main_menu
  end
  list_meal = list_meal.to_i
  list_meal = list_meal-1
  if list_meal == -1 or list_meal > Meal.all.length
    puts "Sorry, not a valid entry"
    sleep(1.5)
    list_meals
  else   
    puts "Press 'a' to add ingredients or 'l' to list all ingredients"
    choice = gets.chomp
    if choice == 'a'
      add_ingredient(list_meal)
    elsif choice == 'l'
      list_ingredients(list_meal)
    end
  end
end

def add_ingredient(list_meal)
  puts "Enter your ingredients below or type 'f' when finished to return to main menu"
  ingredient_input = gets.chomp
  if ingredient_input == 'f'
    main_menu
  else
    new_ingredient = Ingredient.new(ingredient_input)
    Meal.all[list_meal].add_ingredient(new_ingredient)
    puts "* #{new_ingredient.name} * has been added to the recipe for #{Meal.all[list_meal].name}.\n\n"
    add_ingredient(list_meal)
  end
end

def list_ingredients(list_meal)
  puts "Here are the ingredients for *** #{Meal.all[list_meal].name} ***"
  Meal.all[list_meal].ingredients.each_with_index do |ingredient, index|
    puts "#{index+1}. #{ingredient.name}\n\n"
  end
  main_menu
end

main_menu
