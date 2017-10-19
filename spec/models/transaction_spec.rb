require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "validations" do

    it "should have todo and amount and price and total and date" do
      should have_db_column(:todo).of_type(:integer)
      should have_db_column(:price).of_type(:decimal)
      should have_db_column(:amount).of_type(:decimal)
      should have_db_column(:total).of_type(:decimal)
      should have_db_column(:date).of_type(:date)
    end

    describe "validates presence of amount and price and date" do
      it { is_expected.to validate_presence_of(:amount) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:date) }
    end

    describe "validates numerically value of amount and price" do
      it { is_expected.to validate_numericality_of(:amount) }
      it { is_expected.to validate_numericality_of(:price) }
    end

    # happy_path
    describe "can be created when all attributes are present" do
      it "should pass validation" do
        user = create(:user)
        crypto = create(:crypto)
        transaction = create(:transaction, user_id: user.id, crypto_id: crypto.id)
        expect(transaction).to be_valid
      end
    end

    # unhappy_path
    describe "cannot be created without an amount" do
      it "should not pass validation" do
        user = create(:user)
        crypto = create(:crypto)
        transaction = build(:transaction, user_id: user.id, crypto_id: crypto.id, amount: nil)
        expect(transaction).to be_invalid
      end
    end


    describe "cannot be created without a price" do
      it "should not pass validation" do
        user = create(:user)
        crypto = create(:crypto)
        transaction = build(:transaction, user_id: user.id, crypto_id: crypto.id, price: nil)
        expect(transaction).to be_invalid
      end
    end

    describe "should permit numerically amount only" do
      # unhappy_path
      it "sign up with invalid email" do
        user = create(:user)
        crypto = create(:crypto)
        transaction = build(:transaction, user_id: user.id, crypto_id: crypto.id, amount: "abc")
        expect(transaction).to be_invalid
      end
    end

    describe "should permit numerically price only" do
      # unhappy_path
      it "sign up with invalid email" do
        user = create(:user)
        crypto = create(:crypto)
        transaction = build(:transaction, user_id: user.id, crypto_id: crypto.id, price: "abc")
        expect(transaction).to be_invalid
      end
    end
  end

  context 'associations with dependency' do
    it { is_expected.to belong_to(:user)}
    it { is_expected.to belong_to(:crypto)}
  end

  context 'should have callbacks' do
    describe 'run function update_total before save' do
      it 'total value should equal amount multiply by price' do
        user = create(:user)
        crypto = create(:crypto)
        transaction = create(:transaction, user_id: user.id, crypto_id: crypto.id)
        expect(transaction.total).to eq(transaction.amount * transaction.price)
      end
    end
  end

end
