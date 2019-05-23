require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){ FactoryBot.create(:user) }
  let(:log){ FactoryBot.create(:log, user: user) }

  context 'users#new' do
    before do
      get :new
    end
    it 'should get users_new page' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'users#edit' do
    before do
      log_in_as(user)
      get :edit, params: { id: user.id }
    end
    it 'should get users_edit page' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'users#show' do
    before do
      log_in_as(user)
      get :show, params: { id: user.id }
    end
    it 'should get users_show page' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'users#findex' do
    before do
      log_in_as(user)
      get :index
    end
    it 'should get users_index page' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'users#setting' do
    before do
      log_in_as(user)
      get :setting, params: { id: user.id }
    end
    it 'should get users_setting page' do
      expect(response).to have_http_status(:success)
    end
  end
end
