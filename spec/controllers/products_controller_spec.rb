require 'rails_helper'

RSpec.describe 'Products Controller', type: :request do
  let!(:user) { create(:user) }
  let!(:headers) { valid_headers }
  let!(:central) { create(:central) }
  let!(:product_1) { create(:product, central_id: central.id) }
  let!(:product_2) { create(:product, central_id: central.id) }
  let!(:product_3) { create(:product, central_id: central.id) }
  before { central.users << user }
  let!(:warehouse) { central.create_warehouse }
  let!(:component_1) { create(:component, warehouse: warehouse) }
  let!(:component_2) { create(:component, warehouse: warehouse) }
  let!(:component_3) { create(:component, warehouse: warehouse) }
  before { product_3.components << [component_1, component_2, component_3] }
  let(:valid_attributes) { build(:product) }
  let(:invalid_attributes) { build(:product, name: nil) }

  describe 'GET /central/:central_id/products' do
    before { get "/central/#{central.id}/products", params: {}, headers: headers }

    context 'when centrals products exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns centrall products object' do
        expect(json.size).to eq(3)
        expect(json.first['id']).to eq(product_1.id)
        expect(json.last['id']).to eq(product_3.id)
      end
    end
  end

  describe 'GET /central/:central_id/products/:products' do
    before { get "/central/#{central.id}/products/#{product_3.id}", params: {}, headers: headers }

    context 'when centrals menu id exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return values' do
        expect(json['product']['id']).to eq(product_3.id)
        expect(json['product']['name']).to eq(product_3.name)
        expect(json['product']['price']).to eq(product_3.price.to_s)
        expect(json['components'].first['id']).to eq(component_1.id)
        expect(json['components'].last['id']).to eq(component_3.id)
      end
    end
  end

  describe 'Post /central/:central_id/products/' do
    context 'create correct params' do
      before { post "/central/#{central.id}/products/", params: { product: valid_attributes, components:[component_1.id, component_2.id] }.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return created object' do
        expect(json['product']['name']).to eq(valid_attributes.name)
        expect(json['product']['price']).to eq(valid_attributes.price.to_s)
        expect(json['components'].first['id']).to eq(component_1.id)
        expect(json['components'].last['id']).to eq(component_2.id)
      end
    end

    context 'create uncorrect params' do
      before { post "/central/#{central.id}/products/", params: invalid_attributes.to_json, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error message' do
        expect(json['message']).to eq(Message.item_not_created('Product'))
      end
    end
  end

end
