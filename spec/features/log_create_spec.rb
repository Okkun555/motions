require 'rails_helper'

RSpec.feature "LogCreates", type: :feature do
  let(:user){ FactoryBot.create(:user) }

  describe 'create_log_system' do
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
        fill_in 'training_title', with: '胸・肩'
        fill_in 'training_event', with: 'ベンチプレス'
        fill_in 'comment', with: 'test'
        expect{ click_button '投稿' }.to change { Log.count }.by(1)
        expect(page).to have_content '投稿しました。'
        expect(current_path).to eq user_path(user)
      end
    end

    context 'invalid data' do
      it 'should not create new log' do
        fill_in 'training_day', with: ''
        fill_in 'training_title', with: ''
        fill_in 'comment', with: ''
        expect{ click_button '投稿' }.not_to change { Log.count }
        expect(page).to have_content 'トレーニング日を入力してください'
        expect(page).to have_content 'トレーニング名を入力してください'
      end
    end
  end

end
