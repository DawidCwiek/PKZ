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
    before { get "/central/#{central.id}/menus/#{menu_2.id}", params: {}, headers: headers }

    context 'when centrals menu id exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return values' do
        expect(json['id']).to eq(menu_2.id)
        expect(json['name']).to eq(menu_2.name)
        expect(json['active']).to eq(menu_2.active)
      end
    end
  end

  describe 'Post /central/:central_id/menus/' do
    context 'create correct params' do
      before { post "/central/#{central.id}/menus/", params: valid_attributes.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return created object' do
        expect(json['name']).to eq(valid_attributes.name)
        expect(json['active']).to eq(valid_attributes.active)
        expect(json['central_id']).to eq(central.id)
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
      before { put "/central/#{central.id}/menus/#{menu_3.id}", params: valid_attributes.to_json, headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return update object' do
        expect(json['name']).to eq(valid_attributes.name)
        expect(json['active']).to eq(valid_attributes.active)
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
