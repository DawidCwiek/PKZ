require 'rails_helper'

RSpec.describe 'Home Controller', type: :request do
  # add todos owner
  let!(:user) { create(:user) }
  let!(:headers) { valid_headers }
  let!(:central) { create(:central, user_ids: user.id) }
  let!(:store) { create(:store, central_id: central.id, user_ids: user.id) }
  let!(:store_last) { create(:store, user_ids: user.id) }
  let!(:store_no_belong_to_user) { create(:store) }
  let!(:central_no_belong_to_user) { create(:central) }

  describe 'GET /home' do
    before { get '/home', params: {}, headers: headers }
    
    context 'when home exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user central and stores' do
        expect(json.size).to eq(2)
        expect(json['centrals'].size).to eq(1)
        expect(json['stores'].size).to eq(2)
      end

      it 'returns user central correct' do
        expect(json['centrals'].first['id']).to eq(central.id)
      end

      it 'returns user stores correct' do
        expect(json['stores'].first['id']).to eq(store.id)
        expect(json['stores'].last['id']).to eq(store_last.id)
      end
    end

  end

end