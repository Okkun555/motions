require 'rails_helper'

RSpec.feature "UserEditEmails", type: :feature do
  let!(:user){ FactoryBot.create(:user) }

  describe 'user_email_edit_system' do
    before do
      visit login_path
      fill_in 'login_email', with: user.email
      fill_in 'login_password', with: user.password
      click_button 'ログイン'
      visit setting_user_path(user)
    end

    context 'accept valid data' do
      it 'should edit user email' do
        fill_in 'user_email', with: 'update_email@example.com'
        click_button 'メールアドレス更新'
        expect(page).to have_content 'メールアドレスを更新しました。'
        expect(current_path).to eq user_path(user)
      end
    end

    context 'accept invalid data' do
      it 'should not edit user email' do
        fill_in 'user_email', with: ''
        click_button 'メールアドレス更新'
        expect(page).not_to have_content 'メールアドレスを更新しました。'
      end
    end
  end
end
