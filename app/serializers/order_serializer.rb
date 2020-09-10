class OrderSerializer < ActiveModel::Serializer
  attributes :id, :date, :status, :total_price, :created_at, :updated_at

  belongs_to :user
  has_many :food_orders
  has_many :foods, through: :food_orders
end
