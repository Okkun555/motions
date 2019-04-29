require 'rails_helper'

RSpec.feature "UserEdits", type: :feature do
  let!(:user){ FactoryBot.create(:user) }

  describe 'user_edit_system' do
    before do
      visit edit_user_path(user)
    end

    context '#update' do
      context 'accept valid data' do
        it 'should update user' do
          fill_in 'user_name', with: 'userB'
          fill_in 'user_profile', with: 'Hello exeryone. My name is userB'
          click_button 'ユーザー更新'
          expect(page).to have_content 'アカウントを更新しました。'
        end
      end

      context 'accept invalid data' do
        it 'should not update user' do
          fill_in 'user_name', with: 'userB'
          fill_in 'user_profile', with: 'a' * 401
          click_button 'ユーザー更新'
          expect(page).to have_content 'Profile is too long (maximum is 400 characters)'
        end
      end
    end

    context '#destroy' do
      it 'should delete user' do
        expect { click_on 'ユーザー削除' }.to change { User.count }.by(-1)
      end
    end
  end
end
