require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  let!(:user){ FactoryBot.create(:user) }

  describe 'user login system' do
    before do
      visit login_path
    end

    context 'accept valid data' do
      it 'should be logged in user' do
        fill_in 'login_email', with: 'a@example.com'
        fill_in 'login_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        expect(current_path).to eq root_path
      end
    end

    context 'accept invalid data' do
      it 'should not be logged in' do
        fill_in 'login_email', with: ''
        fill_in 'login_password', with: ''
        expect(page).not_to have_content 'ログインしました。'
      end
    end
  end

  describe 'user logoutsystem' do
    before do
      visit login_path
      fill_in 'login_email', with: user.email
      fill_in 'login_password', with: user.password
      click_button 'ログイン'
    end
    it 'should be logged out' do
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end
end
