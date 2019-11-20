# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GardenActivity, type: :model do
  describe ' create garden activity' do
    let(:activity) { FactoryGirl.create(:activity) }
    let(:garden) { FactoryGirl.create(:garden) }

    it 'creates a garden activity' do
      my_activity = GardenActivity.create(activity_id: activity.id, garden_id: garden.id, notes: 'blah blah', weather: 'Hot', date_performed: Time.now)
      expect(my_activity).to be_valid
    end
    it 'should have a date' do
      my_activity = GardenActivity.new(activity_id: activity.id, garden_id: garden.id, notes: 'blah blah', weather: 'Hot', date_performed: '')
      expect(my_activity).not_to be_valid
    end
  end
end
