require 'rails_helper'

RSpec.feature "LogEdits", type: :feature do
  let(:user){ FactoryBot.create(:user) }
  let(:log){ FactoryBot.create(:log, user: user) }
  let(:menu){ FactoryBot.create(:menu, log: log) }

  describe 'edit_log_system' do
    before do
      visit login_path
      fill_in 'login_email', with: user.email
      fill_in 'login_password', with: user.password
      click_button 'ログイン'
      visit new_log_path
      fill_in 'training_day', with: log.training_day
      fill_in 'training_event', with: menu.training_event
      fill_in 'comment', with: log.comment
      click_button '投稿'
      visit edit_log_path(log)
    end

    context 'accept valid data' do
      it 'should edit log' do
        fill_in 'training_day', with: '2019/05/02'
        fill_in 'training_event', with: 'ベンチプレス'
        fill_in 'comment', with: 'memo'
        click_button '更新'
        expect(page).to have_content '更新しました。'
      end
    end

    context 'accept invalid data' do
      it 'should not edit log' do
        fill_in 'training_day', with: ''
        fill_in 'comment', with: ''
        click_button '更新'
        expect(page).not_to have_content '更新しました。'
      end
    end
  end
end
