require 'rails_helper'

RSpec.describe 'Spots', type: :request do

  describe 'GET /index' do
    it 'returns http success' do
      get '/spots/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/spots/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/spots/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/spots/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/spots/destroy'
      expect(response).to have_http_status(:success)
    end
  end

end
