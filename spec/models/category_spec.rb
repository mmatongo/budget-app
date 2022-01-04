require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:category) }
    
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

    it 'should have an icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end

  describe "associations" do
    context "belongs to" do
      subject { FactoryBot.build(:category) }

      it 'should belong to a user' do
        expect(subject).to respond_to(:user)
      end
    end

    context "has many" do
      subject { FactoryBot.build(:category_with_payments, payments_count: 3) }

      it 'should have many payments' do
        expect(subject).to respond_to(:payments)
      end
    end
  end
end
