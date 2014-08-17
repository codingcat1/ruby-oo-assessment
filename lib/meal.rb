class Meal

  @@all_meals = []

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

  def Meal.all
    @@all_meals
  end

  def save
    @@all_meals << self
  end

end
