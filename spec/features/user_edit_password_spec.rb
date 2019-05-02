require 'rails_helper'

RSpec.feature "UserEditPasswords", type: :feature do
  let!(:user){ FactoryBot.create(:user) }

  describe 'user_password_edit_system' do
    before do
      visit login_path
      fill_in 'login_email', with: user.email
      fill_in 'login_password', with: user.password
      click_button 'ログイン'
      visit setting_user_path(user)
    end

    context 'accept valid data' do
      it 'should edit user password' do
        fill_in 'old_password', with: 'password'
        fill_in 'new_password', with: 'pass123'
        fill_in 'new_password_confirmation', with: 'pass123'
        click_button 'パスワード更新'
        expect(page).to have_content 'パスワードを更新しました。'
        expect(current_path).to eq user_path(user)
      end
    end

    context 'accept invalid data' do
      context 'old password is false' do
        it 'should not edit user password' do
          fill_in 'old_password', with: ''
          fill_in 'new_password', with: 'pass123'
          fill_in 'new_password_confirmation', with: 'pass123'
          click_button 'パスワード更新'
          expect(page).not_to have_content 'パスワードを更新しました。'
        end
      end

      context 'new password is invalid' do
        it 'should not edit user password' do
          pending
          fill_in 'old_password', with: 'password'
          fill_in 'new_password', with: 'a'
          fill_in 'new_password_confirmation', with: 'a'
          click_button 'パスワード更新'
          expect(page).not_to have_content 'パスワードを更新しました。'
        end
      end
    end
  end
end
