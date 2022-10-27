require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  describe 'Tests for InventoryFood model validation ' do
    @user = User.new(name: 'Rito', email: 'abcd@gmail.com', password: '123456')
    @inventory = Inventory.new(user: @user, name: 'Hello')
    @food = Food.new(name: 'Kabab', measurement_unit: 'kg', price: 100)
    subject { InventoryFood.new(inventory: @inventory, food: @food, quantity: 5) }
    before { subject.save }

    it 'quantity should not be nil' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it 'quantity should not be less than 0' do
      subject.quantity = -5
      expect(subject).to_not be_valid
    end
    it 'quantity should be 4' do
      subject.quantity = 4
      expect(subject.quantity).to eq 4
    end
  end
end
