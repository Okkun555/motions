require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user){ FactoryBot.create(:user) }

  let(:user_profile){ 'Hello everyone' }
  let(:gim_training){ 'true' }
  let(:house_training){ 'true' }
  let(:weight_training){ 'true' }
  let(:bodyweight_training){ 'true' }
  let(:diet){ 'true' }
  let(:body_make){ 'true' }
  let(:power){ 'true' }
  let(:profile){ user.build_profile(user_profile: user_profile, gim_training: gim_training, house_training: house_training, weight_training: weight_training, bodyweight_training: bodyweight_training, diet: diet, body_make: body_make, power: power) }

  it 'should be valid' do
    expect(profile).to be_valid
  end

  describe 'user_profile validations' do
    context 'user_profile length' do
      let(:user_profile){ 'a' * 401 }

      it 'should be invalid' do
        expect(profile).to be_invalid
      end
    end
  end
end
