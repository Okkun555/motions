require 'rails_helper'

RSpec.describe BodiesController, type: :controller do
  let(:user){ FactoryBot.create(:user) }
  let(:body){ FactoryBot.create(:body, user: user) }

  context 'bodies#new' do
    before do
      log_in_as(user)
      get :new
    end
    it 'should get bodies_new page' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'bodies#index' do
    before do
      log_in_as(user)
      get :index
    end
    it 'should get bodies_index page' do
      expect(response).to have_http_status(:success)
    end
  end
end
