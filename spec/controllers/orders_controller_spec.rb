require 'rails_helper'

RSpec.describe 'Orders Controller', type: :request do
  let!(:user) { create(:user) }
  let!(:headers) { valid_headers }
  let!(:central) { create(:central, user_ids: user.id) }
  let!(:store) { create(:store, central_id: central.id) }
  let!(:product_1) {create(:product, central_id: central.id)}
  let!(:product_2) {create(:product, central_id: central.id)}
  let!(:product_3) {create(:product, central_id: central.id)}
  let(:valid_attributes) { build(:order) }
  let(:invalid_attributes) { build(:order, total_price: nil) }
  before { store.workers.create(user_id: user.id) }
  let!(:order) {create(:order, store_id: store.id)}

  describe 'Post /store/:store_id/orders' do
    context 'create correct params' do
      before { post "/store/#{store.id}/orders", params: { order: valid_attributes, products:[product_1.id, product_2.id] }.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return created object' do
        expect(json['total_price']).to eq(valid_attributes.total_price.to_s)
        expect(json['profit']).to eq(valid_attributes.profit.to_s)
        expect(json['products'].first['id']).to eq(product_1.id)
        expect(json['products'].last['id']).to eq(product_2.id)
      end
    end

    context 'create uncorrect params' do
      before { post "/store/#{store.id}/orders", params: invalid_attributes.to_json, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error message' do
        expect(json['message']).to eq(Message.item_not_created('Order'))
      end
    end
  end

  describe 'update_issued /store/:store_id/orders/:order_id' do
    context 'update_issued' do
      before { put "/store/#{store.id}/orders/#{order.id}", params: {}, headers: headers }

      it 'update_issued' do
        expect(Order.find(order.id).issued).to eq(true)
      end
    end
  end
end
