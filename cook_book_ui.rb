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
  Meal.new(new_meal).save
  puts "*" + "#{new_meal.name}" + "*" " has been saved in your recipe book.\n\n"
  sleep(1)
end



main_menu
