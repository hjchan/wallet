require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do

    it "should have name and email and password_digest and uid" do
      should have_db_column(:name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
      should have_db_column(:uid).of_type(:string)
    end

    describe "validates presence and uniqueness of name and email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_confirmation_of(:password) }
      it { is_expected.to have_secure_password}
    end

    # happy_path
    describe "can be created when all attributes are present" do
      let(:user) { User.create(
        email: "test@test.com",
        password: "123",
        password_confirmation: "123"
      )}
      it "should pass validation" do
        expect(user).to be_valid
      end
    end

    # unhappy_path
    describe "cannot be created without a email" do
      let(:user) { User.create(
        password: "123", 
        password_confirmation: "123"
      )}
      it "should not pass validation" do
        expect(user).to be_invalid
      end
    end


    describe "cannot be created without a password" do
      let(:user) { User.create(
        name: "Test 1", 
        email: "test@test.com"
      )}
      it "should not pass validation" do
        expect(user).to be_invalid
      end
    end

    describe "should permit valid email only" do
      let(:user1) { User.create(name: "Tom", email: "test@test.com", password: "123456", password_confirmation: "123456")}
      let(:user2) { User.create(name: "Delilah",email: "delilah.com", password: "123456", password_confirmation: "123456") }

      # happy_path
      it "sign up with valid email" do
        expect(user1).to be_valid
      end

      # unhappy_path
      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end
    end
  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:cwallets)}
    it { is_expected.to have_many(:cryptos)}
    it { is_expected.to have_many(:transactions)}
  end

  context 'has valid custom function' do

    describe 'cryptocurrency function return all transaction belongs to user' do
      it 'return transaction and transaction1 which belongs to user' do
        user = create(:user)
        crypto = create(:crypto)
        transaction = create(:transaction, user_id: user.id, crypto_id: crypto.id)
        transaction1 = create(:transaction1, user_id: user.id, crypto_id: crypto.id)
        expect(user.cryptocurrency(7)).to eq([transaction, transaction1])
      end
    end

    describe 'total_amount function return total amount of cryptocurrency that belongs to user' do
      it 'return the sum of amount of transaction and transaction1 which belongs to user' do
        user = create(:user)
        crypto = create(:crypto)
        transaction = create(:transaction, user_id: user.id, crypto_id: crypto.id)
        transaction1 = create(:transaction1, user_id: user.id, crypto_id: crypto.id)
        total_amount = transaction.amount + transaction1.amount
        expect(user.total_amount(8, Date.today)).to be ==(total_amount)
      end
    end
  end

end
