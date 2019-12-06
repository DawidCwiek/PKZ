require 'rails_helper'

RSpec.describe 'Centrals Controller', type: :request do
  let!(:user) { create(:user) }
  let!(:headers) { valid_headers }
  let!(:central) { create(:central, user_ids: user.id) }
  let!(:store) { create(:store, central_id: central.id) }
  let!(:store_2) { create(:store, central_id: central.id) }
  let!(:employee) { create(:user) }
  let!(:employee_2) { create(:user) }
  let(:store_valid_attributes) { build(:store, central_id: central.id) }
  let(:store_invalid_attributes) { build(:store, central_id: central.id, name: nil) }
  before {central.users << [ employee, employee_2 ]}
  
  describe 'GET /central' do
    before { get '/central', params: {}, headers: headers }
    
    context 'when home exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns centrall object' do
        expect(json.size).to eq(6)
      end
    end

    context 'correct response' do
      it 'centrall stores employees' do
        expect(json['id']).to eq(central.id)
        expect(json['stores'].first['id']).to eq(store.id)
        expect(json['stores'].last['id']).to eq(store_2.id)
        expect(json['users'].last['id']).to eq(employee_2.id)
        expect(json['address']['id']).to eq(central.address.id)
      end
    end
  end

  describe 'Post /central/:central_id/store' do
    context 'create correct params' do
      before { post "/central/#{central.id}/store/", params: store_valid_attributes.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return created object' do
        expect(json['name']).to eq(store_valid_attributes.name)
        expect(json['central_id']).to eq(central.id)
        expect(json['address']['street']).to eq(store_valid_attributes.address.street)
      end
    end

    context 'create uncorrect params' do
      before { post "/central/#{central.id}/store/", params: store_invalid_attributes.to_json, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error message' do
        expect(json['message']).to eq(Message.item_not_created('Store'))
      end
    end
  end
end
