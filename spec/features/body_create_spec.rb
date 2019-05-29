require 'rails_helper'

RSpec.feature "BodyCreates", type: :feature do
  let(:user){ FactoryBot.create(:user) }

  describe 'create body_data system' do
    before do
      visit login_path
      fill_in 'login_email', with: user.email
      fill_in 'login_password', with: user.password
      click_button 'ログイン'
      visit new_body_path
    end

    context 'accept valid data' do
      it 'should create new body_data' do
        fill_in 'date', with: '2019/05/30'
        fill_in 'user_length', with: '180'
        fill_in 'user_weight', with: '80'
        fill_in 'user_fat_percentage', with: '12'
        expect{ click_button '記録' }.to change { Body.count }.by(1)
        expect(page).to have_content '記録しました。'
      end
    end

    context 'accept invalid data' do
      it 'should not create new body_data' do
        fill_in 'date', with: ''
        fill_in 'user_length', with: '1'
        fill_in 'user_weight', with: '1'
        fill_in 'user_fat_percentage', with: '1'
        expect{ click_button '記録' }.not_to change { Body.count }
        expect(page).to have_content '身長は100より大きい値にしてください'
        expect(page).to have_content '体重は10より大きい値にしてください'
        expect(page).to have_content '体脂肪率は1より大きい値にしてください'
      end
    end
  end
end
