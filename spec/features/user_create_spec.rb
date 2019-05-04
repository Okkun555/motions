require 'rails_helper'

RSpec.feature "UserCreates", type: :feature do
  let(:user){ FactoryBot.create(:user) }

  describe 'user create system' do
    before do
      visit new_user_path
    end

    context 'accept valid data' do
      it 'should create new user' do
        fill_in 'user_name', with: 'user'
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'password_confirmation', with: 'password'
        expect { click_button 'アカウント作成' }.to change { User.count }.by(1)
        expect(page).to have_content 'アカウントを作成しました。'
      end
    end

    context 'accept invalid data' do
      it 'should not create new user' do
        fill_in 'user_name', with: ''
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: 'password'
        fill_in 'password_confirmation', with: 'password'
        expect { click_button 'アカウント作成'}.not_to change { User.count }
        expect(page).to have_content "Name can't be blank"
        expect(page).to have_content "Email can't be blank"
      end
    end
  end
end
