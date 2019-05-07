require 'rails_helper'

RSpec.feature "LogCreates", type: :feature do
  describe 'create logs' do
    let(:user){ FactoryBot.create(:user) }

    before do
      visit login_path
      fill_in 'login_email', with: user.email
      fill_in 'login_password', with: user.password
      click_button 'ログイン'
      visit new_log_path
    end

    context 'valid data' do
      it 'should create new log' do
        fill_in 'training_day', with: '2019/05/01'
        fill_in 'training_menu', with: 'ベンチプレス'
        fill_in 'memo', with: 'test'
        expect{ click_button '投稿' }.to change { Log.count }.by(1)
        expect(page).to have_content '投稿しました。'
        expect(current_path).to eq logs_path(user)
      end
    end

    context 'invalid data' do
      it 'should not create new log' do
        fill_in 'training_day', with: ''
        fill_in 'training_menu', with: ''
        fill_in 'memo', with: ''
        expect{ click_button '投稿' }.not_to change { Log.count }
        expect(page).to have_content "Training day can't be blank"
        expect(page).to have_content "Training menu can't be blank"
      end
    end
  end

end
