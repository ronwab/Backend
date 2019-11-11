# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Garden, type: :model do
  let(:garden) { FactoryGirl.create(:garden) }
  describe 'validates garden parameters' do
    it 'should create a valid garden' do
      garden = Garden.create(plant_name: 'chinese cabbagez', date_planted: '2019-10-28', rows: 81, spacing: 38,
                             notes: 'Books are useless! I only ever read one book, To K...')
      expect(garden).to be_valid
    end
    it 'should contain plant name' do
      garden = Garden.create(plant_name: '', date_planted: '2019-10-28', rows: 81, spacing: 38,
                             notes: 'Books are useless! I only ever read one book, To K...')
      expect(garden).not_to be_valid
    end
    it 'should have a date' do
      binding.pry
      garden = Garden.create(plant_name: 'chinese cabbag', date_planted: '', rows: 81, spacing: 38,
                             notes: 'Books are useless! I only ever read one book, To K...')
      expect(garden).not_to be_valid
    end
  end
end
