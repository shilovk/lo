class Order < ApplicationRecord
  STATUSES = %w[forming processing performed].freeze

  belongs_to :user
  has_many :food_orders
  has_many :foods, through: :food_orders

  attribute :date, :date, default: Time.current.to_date
  attribute :status, :string, default: STATUSES.first
  validates :status, presence: true, inclusion: { in: STATUSES }

  before_create :destroy_old_forming_orders

  scope :on_date, ->(date) { where(date: date).where.not(status: STATUSES.first) }

  def self.find_forming_or_create
    find_or_create_by(status: STATUSES.first)
  end

  def destroy_old_forming_orders
    Order.where(status: STATUSES.first).destroy_all
  end

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
