require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:foods).through(:food_orders) }

  let(:user) { create(:user) }

  describe '#can_add?' do
    let(:first_food) { create(:food, :first) }
    let(:other_first_food) { create(:food, :first) }
    let(:main_food) { create(:food, :main) }
    let(:drink_food) { create(:food, :drink) }
    let(:order) { create(:order, user: user, foods: [first_food]) }

    it 'Adds food to order' do
      expect(order.can_add?(main_food)).to be true
      expect(order.can_add?(drink_food)).to be true
    end

    it 'Can not add food to order' do
      expect(order.can_add?(other_first_food)).to be false
    end
  end

  describe '#add_food' do
    let(:order) { create(:order, user: user) }
    let(:food) { create(:food) }

    it 'Adds food to order' do
      expect { order.add_food(food) }.to change(order.foods, :count).by(1)
    end

    it 'Can not add dublicate food to order' do
      order.add_food(food)
      expect { order.add_food(food) }.to change(order.foods, :count).by(0)
    end
  end
end
