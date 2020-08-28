require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'GET #index' do
    let(:foods) { create_list(:food, 2) }
    before { get :index }

    it 'populates an array of all foods' do
      expect(assigns(:foods)).to match_array(foods)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
