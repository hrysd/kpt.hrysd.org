require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe 'GET fallback' do
    subject(:response) { get :fallback, params: {permalink: permalink} }

    context 'when board exists' do
      let(:permalink) { 'hrysd' }

      expect(response).to have_http_status(200)
    end

    context 'when does not board exists' do
      let(:permalink) { 'does-not-exists' }

      expect(response).to have_http_status(404)
    end
  end
end
