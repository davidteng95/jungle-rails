require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should save if user fields are valid' do
      user = User.new(
        email: 'davidteng@example.com',
        first_name: 'David',
        last_name: 'Teng',
        password: '123456',
        password_confirmation: '123456'
      )

      expect(user).to be_present
    end

    it 'should not save password and password_confirmation do not match' do
      user = User.new(
        email: 'davidteng@example.com',
        first_name: 'David',
        last_name: 'Teng',
        password: '123456',
        password_confirmation: '111111'
      )

      expect(user).not_to be_valid
    end

    it 'should require unique emails that are not case sensitive' do
      user1 = User.create(
        email: 'davidteng1@example.com',
        first_name: 'David',
        last_name: 'Teng',
        password: '123456',
        password_confirmation: '123456'
      )

      user2 = User.create(
        email: 'DAVIDTENG1@EXAMPLE.COM',
        first_name: 'Dave',
        last_name: 'Tengy',
        password: '123456',
        password_confirmation: '123456'
      )

      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should fail if email is empty' do
      user = User.new(
        first_name: 'David',
        last_name: 'Teng',
        password: '123456',
        password_confirmation: '123456'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should fail if first_name is empty' do
      user = User.new(
        email: 'davidteng@example.com',
        last_name: 'Teng',
        password: '123456',
        password_confirmation: '123456'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should fail if last_name is empty' do
      user = User.new(
        email: 'davidteng@example.com',
        first_name: 'David',
        password: '123456',
        password_confirmation: '123456'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should fail if password is too short' do
      user = User.new(
        email: 'davidteng@example.com',
        first_name: 'David',
        last_name: 'Teng',
        password: '1234',
        password_confirmation: '1234'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        email: 'davidteng@example.com',
        first_name: 'David',
        last_name: 'Teng',
        password: '123456',
        password_confirmation: '123456'
      )
    end

    it 'should log in a user given correct credentials' do
      user = User.authenticate_with_credentials('davidteng@example.com', '123456')

      expect(user).to eq(@user)
    end

    it 'should not log in a user with an incorrect email' do
      user = User.authenticate_with_credentials('david@example.com', '123456')

      expect(user).to eq(nil)
    end

    it 'should not log in a user with an incorrect password' do
      user = User.authenticate_with_credentials('david@example.com', '123457')

      expect(user).to eq(nil)
    end

    it 'should log in a user given correct credentials but with white spaces before and after email' do
      user = User.authenticate_with_credentials('  davidteng@example.com  ', '123456')

      expect(user).to eq(@user)
    end

    it 'should log in a user given correct credentials but varied cases in the email' do
      user = User.authenticate_with_credentials('davidTeng@exaMple.Com', '123456')

      expect(user).to eq(@user)
    end

  end

end
