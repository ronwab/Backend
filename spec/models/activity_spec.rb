# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:activity) { FactoryGirl.create(:activity) }
  describe 'validity of activity' do
    it 'creates a valid activity' do
      activity = Activity.create(activity: 'Hiking')
      # binding.pry
      expect(activity).to be_valid
    end
    it ' activity must be present' do
      activity = Activity.create(activity: nil)
      expect(activity).to_not be_valid
    end
    it 'should be strings only' do
      activity = Activity.create(activity: 12_323)
      expect(activity).to_not be_valid
    end
  end
end
