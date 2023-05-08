require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it 'is valid with all the right values' do
      
      params = { first_name: 'john', last_name: 'wick', email: 'a@a.com', password: '123', password_confirmation: '123' }
      expect(User.new(params)).to be_valid
    end

    it 'is invalid with the wrong password' do
      
      params = { first_name: 'john', last_name: 'wick', email: 'a@a.com', password: '123', password_confirmation: '456' }
      expect(User.new(params)).to_not be_valid
    end
    it 'is invalid with the password under 3 characters' do
      
      params = { first_name: 'john', last_name: 'wick', email: 'a@a.com', password: '12', password_confirmation: '123' }
      expect(User.new(params)).to_not be_valid
    end
    
    it 'is invalid with the first name missing' do
      
      params = { first_name: '', last_name: 'wick', email: 'a@a.com', password: '123', password_confirmation: '123' }
      expect(User.new(params)).to_not be_valid
    end

    it 'is invalid with the last name missing' do
      
      params = { first_name: 'john', last_name: nil, email: 'a@a.com', password: '123', password_confirmation: '123' }
      expect(User.new(params)).to_not be_valid
    end

    it 'is invalid with the email missing' do
      
      params = { first_name: 'john', last_name: 'wick', email: '', password: '123', password_confirmation: '123' }
      expect(User.new(params)).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should be invalid or nil if wrong password' do
      @user = User.create(first_name: 'john', last_name: 'wick', email: 'a@a.com', password: '123', password_confirmation: '123')

      current_user = User.authenticate_with_credentials("a@a.com", "126")
      expect(current_user).to be_nil
  
    end

    it 'should return the user email if information is correct' do
      @user = User.create(first_name: 'john',last_name: 'wick', email: 'a@a.com', password: '123', password_confirmation: '123')

      current_user = User.authenticate_with_credentials("a@a.com", "123")
      expect(current_user.email).to eq(@user.email)
  
    end

    it 'should return the user email if information is correct with uppercase and downcase' do
      @user = User.create(first_name: 'john',last_name: 'wick', email: 'a@a.com', password: '123', password_confirmation: '123')

      current_user = User.authenticate_with_credentials("A@A.com", "123")
      expect(current_user.email).to eq(@user.email)
  
    end

    it 'should return the user email if information is correct but with spaces around it' do
      @user = User.create(first_name: 'john',last_name: 'wick', email: 'a@a.com', password: '123', password_confirmation: '123')

      current_user = User.authenticate_with_credentials(" a@a.com ", "123")
      expect(current_user.email).to eq(@user.email)
  
    end



  end


end
