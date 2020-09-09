require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :category }
  it { should validate_presence_of :price }
  it { should have_many(:orders).through(:food_orders) }

  it 'has one attached file' do
    expect(Food.new.image).to be_an_instance_of(ActiveStorage::Attached::One)
  end

  describe 'scopes' do
    let(:foods) { create_list(:food, 2) }

    it '.on date returns all foods created on this date' do
      expect(Food.on_date(Time.current.to_date)).to eq(foods)
    end
  end

  describe '.weak_days' do
    it 'return weak day names' do
      expect(Food.weak_days).to match_array(%w[Monday Tuesday Wednesday	Thursday Friday Saturday Sunday])
    end
  end

  describe '.weak_dates' do
    let(:date) { Time.current.to_date }
    let(:dates) { (date.beginning_of_week..date.end_of_week).to_a }

    it 'return weak dates' do
      expect(Food.weak_dates).to match_array(dates)
    end
  end
end
