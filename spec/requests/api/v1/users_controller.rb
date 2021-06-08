# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  let(:headers) do
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  context 'When user is not authenticated' do

  end

  context 'When user is authenticated' do
    describe 'GET #show' do
      subject { get '/api/v1/users/:id', headers: headers, params: params }

      context 'When user is not existed' do
        let(:user_id) { 1_000_000 }
        let(:params) { { user: { id: user_id } } }

        it 'Should valid error response' do
          subject
          expect(response).to have_http_status :not_found
          expect(JSON.parse(response.body)).to eq({})
        end
      end

      context 'When user is existed' do
        let(:user) { create :user }
        let(:user_id) { user.id }
        let(:params) { { user: { id: user_id } } }

        it 'Should valid response' do
          json_response = { email: user.email }
          subject
          expect(response).to have_http_status :ok
          expect(JSON.parse(response.body)).to eq JSON.parse(json_response.to_json)
        end
      end
    end
  end
end
