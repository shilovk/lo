require 'rails_helper'

RSpec.describe FoodOrder, type: :model do
  it { should belong_to(:food) }
  it { should belong_to(:order) }
end
