require 'rspec'
require 'meal'

describe Meal do
  it "will initialize when a meal name is input" do
    test_meal = Meal.new 'Clam chowder'
    expect(test_meal).to be_an_instance_of Meal
  end
end
