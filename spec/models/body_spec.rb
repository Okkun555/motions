require 'rails_helper'

RSpec.describe Body, type: :model do
  let(:user){ FactoryBot.create(:user) }

  let(:date){ '2019/05/01' }
  let(:length){ '170' }
  let(:weight){ '60' }
  let(:fat_percentage) { '14' }
  let(:body){ user.bodies.new(date: date,
                              length: length,
                              weight: weight,
                              fat_percentage: fat_percentage) }

  shared_examples_for 'should not be invalid' do
    it { expect(body).to be_invalid }
  end

  it 'should be valid' do
    expect(body).to be_valid
  end

  describe 'date validations' do
    context 'date presence' do
      let(:date){ '' }
      it_behaves_like 'should not be invalid'
    end
  end

  describe 'length validations' do
    context 'length presence' do
      let(:length){ '' }
      it_behaves_like 'should not be invalid'
    end

    context 'length is integer or float' do
      let(:length){ '身長' }
      it_behaves_like 'should not be invalid'
    end

    context 'length min 100cm' do
      let(:length){ '1' }
      it_behaves_like 'should not be invalid'
    end
  end

  describe 'weight validations' do
    context 'weight presence' do
      let(:weight){ '' }
      it_behaves_like 'should not be invalid'
    end

    context 'weight is integer or float' do
      let(:weight){ '体重' }
      it_behaves_like 'should not be invalid'
    end

    context 'weight min 10kg' do
      let(:weight){ '1' }
      it_behaves_like 'should not be invalid'
    end
  end

  describe 'fat_percentage validations' do
    context 'fat_percentage is integer or float' do
      let(:fat_percentage){ '体脂肪率' }
      it_behaves_like 'should not be invalid'
    end

    context 'fat_percentage min 1%' do
      let(:fat_percentage){ '0' }
      it_behaves_like 'should not be invalid'
    end

    context 'fat_percentage max 70%' do
      let(:fat_percentage){ '71' }
      it_behaves_like 'should not be invalid'
    end
  end
end
