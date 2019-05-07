require 'rails_helper'

RSpec.describe LogsController, type: :controller do
  let(:user){ FactoryBot.create(:user) }
  let(:log){ FactoryBot.create(:log, user: user) }

  context '#new' do
    before do
      log_in_as(user)
      get :new
    end
    it 'should get logs_new page' do
      expect(response).to have_http_status(:success)
    end
  end

  context '#show' do
    before do
      log_in_as(user)
      get :show, params: { id: log.id }
    end
    it 'should get logs_show page' do
      expect(response).to have_http_status(:success)
    end
  end
end
