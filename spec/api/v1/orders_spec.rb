require 'rails_helper'

describe 'Orders API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end
  let!(:current_user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: current_user.id) }
  let(:fields) { %w[id date status total_price created_at updated_at] }

  describe 'GET /api/v1/orders' do
    let(:method) { :get }
    let(:api_path) { '/api/v1/orders' }

    it_behaves_like 'API Authorizable'

    context 'authorized' do
      let!(:orders) { create_list(:order, 2, :performed, foods: create_list(:food, 2)) }
      let(:resource) { orders.first }
      let(:resource_response) { json['orders'].first }

      before do
        do_request method, api_path, params: { access_token: access_token.token }, headers: headers
      end

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of orders' do
        expect(json['orders'].size).to eq 2
      end

      include_examples 'API public fields returnable'

      it 'contains user object' do
        expect(resource_response['user']['id']).to eq resource.user.id
      end

      it 'contains status' do
        expect(resource_response['status']).to eq resource.status
      end

      it 'contains food object' do
        expect(resource_response['foods'].first['id']).to eq resource.foods.first.id
      end
    end
  end

  describe 'GET /api/v1/orders/:id' do
    let(:method) { :get }
    let!(:resource) { create(:order, :performed) }
    let(:api_path) { api_v1_order_path(resource) }

    it_behaves_like 'API Authorizable'

    context 'authorized' do
      let(:resource_response) { json['order'] }

      before do
        do_request method, api_path, params: { access_token: access_token.token }, headers: headers
      end

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      include_examples 'API public fields returnable'
    end
  end
end
