require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  context '#home' do
    before do
      get :home
    end
    it 'should get page' do
      expect(response).to have_http_status(:success)
    end
  end
end
