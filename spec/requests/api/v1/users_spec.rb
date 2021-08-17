require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:user) {create(:user)}
  context "when user is logged" do
    before do
      sign_in(user)
    end
    
    describe "GET /index" do
      before do
        get '/api/v1/users/index'
      end

      it 'returns a forbidden response' do
        expect(response).to have_http_status(:forbidden)
      end

      it 'does not respond with a json' do
        expect(response.content_type).not_to  eq('application/json; charset=utf-8')
      end
    end
    
    describe 'GET /show' do
      context 'when user is accessing his own profile' do
        before do
          get "/api/v1/users/show/#{user.id}"
        end

        it 'has an OK response' do
          expect(response).to have_http_status(:ok)
        end

        it 'responds with a json' do
          expect(response.content_type).to eq('application/json; charset=utf-8')
        end
      end

      context 'when user is accessing another user profile' do
        before do
          other_user = create(:user, email: 'testeuser@email.com')
          get "/api/v1/users/show/#{other_user.id}"
        end

        it 'has a forbidden response' do
          expect(response).to have_http_status(:forbidden)
        end

        it 'does not respond with a json' do
          expect(response.content_type).not_to eq('application/json; charset=utf-8')
        end
      end

      context 'when user does not exist' do
        it 'throws a not found status' do
          user.destroy
          get "/api/v1/users/show/#{user.id}"
          expect(response).to have_http_status(:not_found)
        end
      end
    end
    
  end
end

