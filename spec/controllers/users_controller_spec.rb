require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context '#new' do
    before do
      get :new
    end
    it 'should get page' do
      expect(response).to have_http_status(:success)
    end
  end
end
