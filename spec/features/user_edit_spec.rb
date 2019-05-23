require 'rails_helper'

RSpec.feature "UserEdits", type: :feature do
  let(:user){ FactoryBot.create(:user) }

  describe 'user edit system' do
    before do
      visit login_path
      fill_in 'login_email', with: user.email
      fill_in 'login_password', with: user.password
      click_button 'ログイン'
      visit edit_user_path(user)
    end

    context 'user update' do
      context 'accept valid data' do
        it 'should update user' do
          fill_in 'user_name', with: 'userB'
          fill_in 'user_profile', with: 'Hello exeryone. My name is userB'
          click_button 'プロフィール更新'
          expect(page).to have_content 'アカウントを更新しました。'
        end
      end

      context 'accept invalid data' do
        it 'should not update user' do
          fill_in 'user_name', with: 'userB'
          fill_in 'user_profile', with: 'a' * 401
          click_button 'プロフィール更新'
          expect(page).to have_content 'プロフィールは400文字以内で入力してください'
        end
      end
    end

    context 'user delete' do
      before do
        visit user_path(user)
      end
      it 'should delete user' do
        expect { click_on 'ユーザー削除' }.to change { User.count }.by(-1)
      end
    end
  end
end
