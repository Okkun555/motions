require 'rails_helper'

RSpec.describe Log, type: :model do
  let(:user){ FactoryBot.create(:user) }

  let(:training_day){ '2019/05/01' }
  let(:training_menu){ 'ベンチプレス' }
  let(:memo){ 'test' }
  let(:log){ user.logs.new(training_day: training_day, training_menu: training_menu, memo: memo) }

  shared_examples_for 'should be invalid' do
    it { expect(log).to be_invalid }
  end

  it 'should be valid' do
    expect(log).to be_valid
  end

  describe 'training_day validation' do
    context 'present training_day' do
      let(:training_day){ '' }

      it_behaves_like 'should be invalid'
    end
  end

  describe 'training_menu validation' do
    context 'present training_menu' do
      let(:training_menu){ '' }

      it_behaves_like 'should be invalid'
    end
  end

  describe 'memo validation' do
    context 'too long memo' do
      let(:memo){ 'a' * 101 }

      it_behaves_like 'should be invalid'
    end
  end
end
