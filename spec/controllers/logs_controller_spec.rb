require 'rails_helper'

RSpec.describe LogsController, type: :controller do
  let(:user){ FactoryBot.create(:user) }
  let(:log){ FactoryBot.crate(:log, user: user) }

  context '#new' do
    before do
      log_in_as(user)
      get :new
    end
    it 'should get logs_new page' do
      expect(response).to have_http_status(:success)
    end
  end
end
