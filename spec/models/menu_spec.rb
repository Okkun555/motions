require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:user){ FactoryBot.create(:user) }

  let(:training_day){ '2019/05/01' }
  let(:comment){ 'test' }
  let(:log){ user.logs.new(training_day: training_day, comment: comment) }

  let(:training_event){ 'ベンチプレス' }
  let(:training_weight){ '100' }
  let(:reps){ '10' }
  let(:training_time){ '60' }
  let(:distance){ '3' }
  let(:menu){ log.menus.new(training_event: training_event, training_weight: training_weight, reps: reps, training_time: training_time, distance: distance) }

  shared_examples_for 'should be invalid' do
    it { expect(menu).to be_invalid }
  end

  it 'should be valid' do
    expect(menu).to be_valid
  end

  describe 'training_event validation' do
    context 'present training_event' do
      let(:training_event){ '' }

      it_behaves_like 'should be invalid'
    end

    context 'too long training_event' do
      let(:training_event){ 'a' * 21 }

      it_behaves_like 'should be invalid'
    end
  end
end
