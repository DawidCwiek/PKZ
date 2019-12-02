require 'rails_helper'

RSpec.describe 'Components Controller', type: :request do
  let!(:user) { create(:user) }
  let!(:headers) { valid_headers }
  let!(:central) { create(:central) }
  before { central.users << user }

  let!(:component_1) { create(:component, warehouse: central.warehouse) }
  let!(:component_2) { create(:component, warehouse: central.warehouse) }
  let!(:component_3) { create(:component, warehouse: central.warehouse) }
  
  let(:valid_attributes) { build(:component) }
  let(:invalid_attributes) { build(:component, name: nil) }

  describe 'GET /central/:central_id/products' do
    before { get "/central/#{central.id}/components", params: {}, headers: headers }

    context 'when centrals components exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns centrall components object' do
        expect(json.size).to eq(3)
        expect(json.first['id']).to eq(component_1.id)
        expect(json.last['id']).to eq(component_3.id)
      end
    end
  end

  describe 'GET /central/:central_id/components/:component_id' do
    before { get "/central/#{central.id}/components/#{component_3.id}", params: {}, headers: headers }

    context 'when centrals components id exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return values' do
        expect(json['id']).to eq(component_3.id)
        expect(json['quantity']).to eq(component_3.quantity)
        expect(json['cost']).to eq(component_3.cost.to_s)
      end
    end
  end

  describe 'Post /central/:central_id/components/' do
    context 'create correct params' do
      before { post "/central/#{central.id}/components/", params: valid_attributes.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return created object' do
        expect(json['name']).to eq(valid_attributes.name)
        expect(json['quantity']).to eq(valid_attributes.quantity)
        expect(json['cost']).to eq(valid_attributes.cost.to_s)
       
      end
    end

    context 'create uncorrect params' do
      before { post "/central/#{central.id}/components/", params: invalid_attributes.to_json, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error message' do
        expect(json['message']).to eq(Message.item_not_created('Component'))
      end
    end
  end

  describe 'Put /central/:central_id/components/:component_id' do
    context 'update correct params' do
      before { put "/central/#{central.id}/components/#{component_1.id}", params: valid_attributes.to_json, headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return update object' do
        expect(json['id']).to eq(component_1.id)
        expect(json['name']).to eq(valid_attributes.name)
        expect(json['quantity']).to eq(valid_attributes.quantity)
        expect(json['cost']).to eq(valid_attributes.cost.to_s)
      end
    end

    context 'update uncorrect params' do
      before { put "/central/#{central.id}/components/#{component_1.id}", params: invalid_attributes.to_json, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error message' do
        expect(json['message']).to eq(Message.item_not_update('Component'))
      end
    end
  end

  describe 'delete /central/:central_id/products/:products_id' do
    context 'update correct params' do
      subject { delete "/central/#{central.id}/components/#{component_2.id}", params: {}, headers: headers }

      it 'delete product' do
        expect { subject }.to change(Component, :count).by(-1)
      end
    end
  end
end
