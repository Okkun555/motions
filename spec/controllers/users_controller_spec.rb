require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){ FactoryBot.create(:user) }

  context '#new' do
    before do
      get :new
    end
    it 'should get user_new page' do
      expect(response).to have_http_status(:success)
    end
  end

  context '#edit' do
    before do
      get :edit, params: { id: user.id }
    end
    it 'should get user_edit page' do
      expect(response).to have_http_status(:success)
    end
  end
end
