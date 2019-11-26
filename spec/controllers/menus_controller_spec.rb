require 'rails_helper'

RSpec.describe 'Menus Controller', type: :request do
  let!(:user) { create(:user) }
  let!(:headers) { valid_headers }
  let!(:central) { create(:central, user_ids: user.id) }
  let!(:menu_1) { create(:menu, central_id: central.id) }
  let!(:menu_2) { create(:menu, central_id: central.id) }
  let!(:menu_3) { create(:menu, central_id: central.id) }
  let(:valid_attributes) { build(:menu) }
  let(:invalid_attributes) { build(:menu, name: nil) }
  let!(:product_1) {create(:product, central_id: central.id)}
  let!(:product_2) {create(:product, central_id: central.id)}
  let!(:product_3) {create(:product, central_id: central.id)}
  before { menu_3.products << [product_1, product_2] }

  describe 'GET /central/:central_id/menus' do
    before { get "/central/#{central.id}/menus", params: {}, headers: headers }

    context 'when centrals menus exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns centrall object' do
        expect(json.size).to eq(3)
      end
    end
  end

  describe 'GET /central/:central_id/menus/:menu_id' do
    before { get "/central/#{central.id}/menus/#{menu_3.id}", params: {}, headers: headers }

    context 'when centrals menu id exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return values' do
        expect(json['menu']['id']).to eq(menu_3.id)
        expect(json['menu']['name']).to eq(menu_3.name)
        expect(json['menu']['active']).to eq(menu_3.active)
        expect(json['products'].first['id']).to eq(product_1.id)
        expect(json['products'].last['id']).to eq(product_2.id)
      end
    end
  end

  describe 'Post /central/:central_id/menus/' do
    context 'create correct params' do
      before { post "/central/#{central.id}/menus/", params: { menu: valid_attributes, products:[product_1.id, product_2.id] }.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return created object' do
        expect(json['menu']['name']).to eq(valid_attributes.name)
        expect(json['menu']['active']).to eq(valid_attributes.active)
        expect(json['menu']['central_id']).to eq(central.id)
        expect(json['products'].first['id']).to eq(product_1.id)
        expect(json['products'].last['id']).to eq(product_2.id)
      end
    end

    context 'create uncorrect params' do
      before { post "/central/#{central.id}/menus/", params: invalid_attributes.to_json, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error message' do
        expect(json['message']).to eq(Message.item_not_created('Menu'))
      end
    end
  end

  describe 'Put /central/:central_id/menus/:menu_id' do
    context 'update correct params' do
      before { put "/central/#{central.id}/menus/#{menu_3.id}", params: { menu: valid_attributes, products:[product_1.id, product_3.id] }.to_json, headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return update object' do
        expect(json['menu']['name']).to eq(valid_attributes.name)
        expect(json['menu']['active']).to eq(valid_attributes.active)
        expect(json['products'].first['id']).to eq(product_1.id)
        expect(json['products'].last['id']).to eq(product_3.id)
      end
    end

    context 'update uncorrect params' do
      before { put "/central/#{central.id}/menus/#{menu_3.id}", params: invalid_attributes.to_json, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error message' do
        expect(json['message']).to eq(Message.item_not_update('Menu'))
      end
    end
  end

  describe 'delete /central/:central_id/menus/:menu_id' do
    context 'update correct params' do
      subject { delete "/central/#{central.id}/menus/#{menu_1.id}", params: {}, headers: headers }

      it 'delete menu' do
        expect { subject }.to change(Menu, :count).by(-1)
      end
    end
  end
end
