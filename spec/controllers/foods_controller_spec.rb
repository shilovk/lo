require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'GET #index' do
    before do
      login(create(:user))
      get :index
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
