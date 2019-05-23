require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context 'sessions#new' do
    before do
      get :new
    end
    it 'should get sessions_new page' do
      expect(response).to have_http_status(:success)
    end
  end
end
