class Order < ApplicationRecord
  belongs_to :user
  has_many :food_orders
  has_many :foods, through: :food_orders

  def can_add?(food)
    return false if foods.include? food
    return false if foods.map(&:category).include? food.category

    true
  end

  def add_food(food)
    return unless food
    return unless can_add?(food)

    foods.push food
  end
end
