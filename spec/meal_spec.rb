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


end
