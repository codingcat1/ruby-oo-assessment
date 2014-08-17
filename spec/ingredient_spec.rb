require 'rspec'
require 'ingredient'

describe Ingredient do
  it "will initialize when an ingredient is inputted" do
    test_ingredient = Ingredient.new 'rice'
    expect(test_ingredient).to be_an_instance_of Ingredient
  end

  it "shows user the inputted ingredient name" do
    test_ingredient = Ingredient.new 'rice'
    expect(test_ingredient.name).to eq 'rice'
  end

end
