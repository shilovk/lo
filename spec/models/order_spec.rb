require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:foods).through(:food_orders) }
  it { should validate_presence_of :status }
  it { should allow_values('forming', 'processing', 'performed').for(:status) }

  it 'Has forming in status by default' do
    expect(create(:order).status).to eq('forming')
  end

  it 'Has today in date by default' do
    expect(create(:order).date).to eq(Time.current.to_date)
  end

  it 'Before create deletes old forming orders for the past days' do
    create(:order, date: Time.current.to_date - 1.day)
    create(:order)
    expect(Order.where(status: 'forming').count).to eq(1)
  end

  describe '.total_cost' do
    let!(:orders) { create_list(:order, 3, :performed, total_price: 5) }
    let!(:total_cost) { orders.sum(&:total_price) }

    it 'calculates total cost for today' do
      expect(Order.total_cost).to eq(total_cost)
    end
  end

  describe '.find_forming_or_create' do
    let(:other_order) { create(:order, status: 'processing') }

    context 'Find' do
      let(:order) { create(:order) }

      it 'forming order for today' do
        expect(Order.find_forming_or_create.status).to eq(order.status)
      end
    end

    context 'Create' do
      let(:order) { Order.find_forming_or_create }

      it 'forming order for today' do
        expect(order.status).to eq('forming')
      end
    end
  end

  describe '#can_add?' do
    let(:first_food) { create(:food, :first) }
    let(:other_first_food) { create(:food, :first) }
    let(:main_food) { create(:food, :main) }
    let(:drink_food) { create(:food, :drink) }
    let(:order) { create(:order, foods: [first_food]) }

    it 'Adds food to order' do
      expect(order.can_add?(main_food)).to be true
      expect(order.can_add?(drink_food)).to be true
    end

    it 'Can not add food to order' do
      expect(order.can_add?(other_first_food)).to be false
    end
  end

  describe '#add_food' do
    let(:order) { create(:order) }
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
