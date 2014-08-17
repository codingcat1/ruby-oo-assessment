require 'rspec'
require 'meal'

describe Meal do
  it "will initialize when a meal name is input" do
    test_meal = Meal.new 'Fried rice'
    expect(test_meal).to be_an_instance_of Meal
  end

  it "shows user the inputted meal name" do
    test_meal = Meal.new 'Fried rice'
    expect(test_meal.name).to eq 'Fried rice'
  end

  it "starts out with an empty list of ingredients" do
    test_meal = Meal.new 'Fried rice'
    expect(test_meal.ingredients).to eq []
  end

  it "can add ingredients to a meal" do
    test_meal = Meal.new 'Fried rice'
    test_ingredient = Ingredient.new 'rice'
    test_meal.add_ingredient(test_ingredient)
    expect(test_meal.ingredients).to eq [test_ingredient]
  end

  it "will save a meal when inputted" do
    test_meal = Meal.new 'Fried rice'
    test_meal.save
    expect(Meal.all).to eq [test_meal]
  end

end
