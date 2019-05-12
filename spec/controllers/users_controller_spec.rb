require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){ FactoryBot.create(:user) }
  let(:log){ FactoryBot.create(:log, user: user) }
  

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
      log_in_as(user)
      get :edit, params: { id: user.id }
    end
    it 'should get user_edit page' do
      expect(response).to have_http_status(:success)
    end
  end

  context '#show' do
    before do
      log_in_as(user)
      get :show, params: { id: user.id }
    end
    it 'should get user_show page' do
      expect(response).to have_http_status(:success)
    end
  end

  context '#setting' do
    before do
      get :setting, params: { id: user.id }
    end
  end
end
