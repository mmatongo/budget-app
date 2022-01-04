require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:user) }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have an empty name' do
      subject.name = ""
      expect(subject).to_not be_valid
    end

    it 'should have a name no longer than 255 chars' do
      subject.name = "a" * 256
      expect(subject).to_not be_valid
    end

    it 'should have an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe "associations" do
    context "has_many" do
      subject { FactoryBot.create(:user_with_categories, categories_count: 3) }

      it 'should have many categories' do
        expect(subject.categories.count).to eq(3)
      end
    end

    context "has_many" do
      subject { FactoryBot.build(:user_with_payments, payments_count: 3) }

      it 'should have many payments' do
        expect(subject.payments.length).to eq(3)
      end
    end
  end
end
