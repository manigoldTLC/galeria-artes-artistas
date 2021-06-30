require 'rails_helper'

RSpec.describe 'Api::V1::Artists', type: :request do
  context 'GET /index' do
    it 'check if all artists are showing' do
      get '/api/v1/artists/index_artists'
      expect(response).to have_http_status(:ok)
    end
  end

  context 'POST /create' do
    let(:artista) do
      {
        name: 'Artista',
        description: 'Aqui jaz uma descrição'
      }
    end

    it 'check if all artists are creating with valid params' do
      post '/api/v1/artists/create', params: { artist: artista }
      expect(response).to have_http_status(:created)
    end

    it 'check if all artists are without valid params' do
      artista = { name: '' }
      post '/api/v1/artists/create', params: { artist: artista }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'GET /show' do
    it 'check if artist exists' do
      artista = create(:artist)
      get "/api/v1/artists/show/#{artista.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'check if an artist does not exist' do
      get '/api/v1/artists/show/1'
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'PUT /update' do
    let(:artista) { create(:artist) }

    atualizado = {
      name: 'Edvard Munch',
      description: 'Edvard Munch foi um pintor norueguês, um dos precursores do impressionismo e expressionismo.'
    }

    it 'check if the artist information has been updated' do
      put "/api/v1/artists/update/#{artista.id}", params: { artist: atualizado }
      artista.reload
      expect(response).to have_http_status(:ok)
    end

    it 'check if the artist information was not updated successfully' do
      put '/api/v1/artists/update/5', params: { artist: atualizado }
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'DELETE /destroy' do
    let(:artista) { create(:artist) }

    it 'check if the product was deleted successfully' do
      delete "/api/v1/artists/destroy/#{artista.id}"
      expect(response).to have_http_status(:ok)
      expect(Artist.find_by(id: artista.id)).to be_nil
    end

    it 'check artist already deleted, non-existent' do
      artista.destroy!
      delete "/api/v1/artists/destroy/#{artista.id}"
      expect(response).to have_http_status(:bad_request)
    end
  end
end
