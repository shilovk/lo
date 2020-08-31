module FoodsHelper
  def food_link(food)
    return "#{food.title} - #{food.price}$"
  end
end
