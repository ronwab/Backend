# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fertilizer, type: :model do
  let(:fertilizer) { FactoryGirl.create(:fertilizer) }

  describe 'create valid Fertilizer object' do
    it 'should create a valid fertilizer object' do
      fert = Fertilizer.create(fertilizer_name: 'RonFert', date_bought: '2019-10-27', quantity: 54)
      expect(fert).to be_valid
    end
    it 'should have a fertilizer name' do
      fert = Fertilizer.create(fertilizer_name: '', date_bought: '2019-10-27', quantity: 54)
      expect(fert).not_to be_valid
    end
    it 'should have a quantity' do
      fert = Fertilizer.create(fertilizer_name: '', date_bought: '2019-10-27', quantity: '')
      expect(fert).not_to be_valid
    end
    it 'should have a quantity be numeric only' do
      fert = Fertilizer.create(fertilizer_name: '', date_bought: '2019-10-27', quantity: 'AAA')
      expect(fert).not_to be_valid
    end
    it 'should have a date' do
      fert = Fertilizer.create(fertilizer_name: '', date_bought: '', quantity: 'AAA')
      expect(fert).not_to be_valid
    end
  end
end
