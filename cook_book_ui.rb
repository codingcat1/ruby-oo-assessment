require './lib/meal'
require './lib/ingredient'

def main_menu
  loop do
    system 'clear'
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
      sleep(1)
      exit
    else
      puts "Not a valid entry.  Please try again."
      sleep(1.5)
    end
  end
end


main_menu
