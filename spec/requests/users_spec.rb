require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let!(:central) { create(:central) }
  let!(:store) { create(:store) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes_central) { attributes_for(:user, central_id: central.id) }
  let(:valid_attributes_store) { attributes_for(:user, store_id: store.id) }

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid central request' do
      before { post '/signup', params: valid_attributes_central.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
        expect(User.last.centrals.first.id).to eq(central.id)
      end
    end

    context 'when valid store request' do
      before { post '/signup', params: valid_attributes_store.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
        expect(User.last.stores.first.id).to eq(store.id)
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Email can't be blank, Name can't be blank, Surname can't be blank, Phone number can't be blank/)
      end
    end
  end
end