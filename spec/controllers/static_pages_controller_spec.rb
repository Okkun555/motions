require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  context 'static_pages#home' do
    before do
      get :home
    end
    it 'should get static_pages_home page' do
      expect(response).to have_http_status(:success)
    end
  end
end
