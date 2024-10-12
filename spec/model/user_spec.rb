RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a password and password_confirmation that match' do
      user = User.new(password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'is not valid when password and password_confirmation do not match' do
      user = User.new(password: 'password', password_confirmation: 'different')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email, first name, and last name' do
      user = User.new(email: nil, first_name: nil, last_name: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without a unique email (case insensitive)' do
      User.create!(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      duplicate_user = User.new(email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password')
      expect(duplicate_user).to_not be_valid
    end

    it 'is not valid when password is shorter than 6 characters' do
      user = User.new(password: 'short', password_confirmation: 'short')
      expect(user).to_not be_valid
    end

    
    describe '.authenticate_with_credentials' do
      before do
        @user = User.create!(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      end
    
      it 'returns the user if credentials are correct' do
        authenticated_user = User.authenticate_with_credentials('test@test.com', 'password')
        expect(authenticated_user).to eq(@user)
      end
    
      it 'returns nil if credentials are incorrect' do
        authenticated_user = User.authenticate_with_credentials('test@test.com', 'wrongpassword')
        expect(authenticated_user).to be_nil
      end
    
      it 'authenticates with leading/trailing spaces in email' do
        authenticated_user = User.authenticate_with_credentials('  test@test.com  ', 'password')
        expect(authenticated_user).to eq(@user)
      end
    
      it 'authenticates with email in wrong case' do
        authenticated_user = User.authenticate_with_credentials('TEST@TEST.COM', 'password')
        expect(authenticated_user).to eq(@user)
      end
    end


  end