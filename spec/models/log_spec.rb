require 'rails_helper'

RSpec.describe Log, type: :model do
  let(:user){ FactoryBot.create(:user) }

  let(:training_day){ '2019/05/01' }
  let(:training_title){ '胸・背中' }
  let(:comment){ 'test' }
  let(:log){ user.logs.new(training_day: training_day, training_title: training_title, comment: comment) }

  shared_examples_for 'should be invalid' do
    it { expect(log).to be_invalid }
  end

  it 'should be valid' do
    expect(log).to be_valid
  end

  describe 'training_day validation' do
    context 'training_day presence' do
      let(:training_day){ '' }
      it_behaves_like 'should be invalid'
    end
  end

  describe 'training_title validatio' do
    context 'training_title presence' do
      let(:training_title){ '' }
      it_behaves_like 'should be invalid'
    end

    context 'training_title length' do
      let(:training_title){ 'a' * 21 }
      it_behaves_like 'should be invalid'
    end
  end

  describe 'comment validation' do
    context 'comment length' do
      let(:comment){ 'a' * 401 }
      it_behaves_like 'should be invalid'
    end
  end
end
