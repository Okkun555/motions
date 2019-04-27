require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name){ 'userA' }
  let(:email){ 'a@example.com' }
  let(:password){ 'password' }
  let(:password_confirmation){ 'password' }
  let(:user){ User.new(name: name, email: email, password: password, password_confirmation: password_confirmation) }

  let(:user_b){ User.new(name: 'userB', email: 'b@example.com', password: 'password', password_confirmation: 'password') }

  shared_examples_for 'should be invalid' do
    it { expect(user).to be_invalid }
  end

  it 'should be valid' do
    expect(user).to be_valid
  end

  describe 'name validations' do
    context 'precent name' do
      let(:name){ '' }

      it_behaves_like 'should be invalid'
    end

    context 'too long name' do
      let(:name){ 'a' * 31 }

      it_behaves_like 'should be invalid'
    end
  end

  describe 'email validations' do
    context 'present email' do
      let(:email){ '' }

      it_behaves_like 'should be invalid'
    end

    context 'too long email' do
      let(:email){ 'a' * 244 + '@example.com' }

      it_behaves_like 'should be invalid'
    end

    context 'format email' do
      context 'accept valide adresses' do
        it 'should create user' do
          valid_addresses = %w[user@example.com USER@foo.COM A_USER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
          valid_addresses.each do |valid_address|
            user.email = valid_address
            expect(user).to be_valid, "#{valid_address.inspect} should be valid"
          end
        end
      end

      context 'accept invalid adresses' do
        it 'should not create user' do
          invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
          invalid_addresses.each do |invalid_address|
            user.email = invalid_address
            expect(user).to be_invalid, "#{invalid_address.inspect} should be invalid"
          end
        end
      end
    end

    context 'uniqueness email' do
      before do
        user.save
        user_b.email = user.email
      end
      it 'should be invalid' do
        expect(user_b).to be_invalid
      end
    end
  end

  describe 'password validations' do
    context 'present password' do
      let(:password){ '' }

      it_behaves_like 'should be invalid'
    end

    context 'too short password' do
      let(:password){ 'a' * 5 }

      it_behaves_like 'should be invalid'
    end
  end
end
