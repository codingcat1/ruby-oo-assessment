class Meal


  def initialize(name)
    @name = name
    @ingredients = []
  end

  def name
    @name
  end

  def ingredients
    @ingredients
  end

  def add_ingredient(new_ingredient)
    @ingredients << new_ingredient
  end


end
