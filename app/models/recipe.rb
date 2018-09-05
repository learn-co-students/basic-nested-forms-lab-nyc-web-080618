class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attributes)
    # byebug
    ingredients_attributes.each do |i, attribute|
       self.ingredients << Ingredient.find_or_create_by(attribute)
    end
  end
end
