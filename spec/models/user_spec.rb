require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }

  describe '#set_admin' do
    let(:users) { create_list(:user, 2) }

    it 'Returns true if first user is admin' do
      expect(users.first.admin).to be true
    end

    it 'Returns true if second user is not admin' do
      expect(users.last.admin).to be false
    end
  end

  describe '#admin?' do
    let(:users) { create_list(:user, 2) }

    it 'Returns true if first user is admin' do
      expect(users.first.admin?).to be true
    end

    it 'Returns true if second user is not admin' do
      expect(users.second.admin?).to be false
    end
  end
end
