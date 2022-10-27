require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Tests for Food model validation ' do
    subject { Food.new(name: 'Kabab', measurement_unit: 'kg', price: 100) }
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'name should be between 3 - 10 characters' do
      subject.name = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
             Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
             took a galley of type and scrambled it to make a type specimen book.
              It has survived not only five centuries"
      expect(subject).to_not be_valid
    end

    it 'price should not be less than 0' do
      subject.price = -4
      expect(subject).to_not be_valid
    end

    it 'measurment should be kg' do
      expect(subject.measurement_unit).to eq 'kg'
    end
    it 'price should not be nil' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
