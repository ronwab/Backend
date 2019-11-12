require 'rails_helper'

RSpec.describe GardenActivity, type: :model do


  describe ' create garden activity' do

    before(:each) do
      let(:activity) { FactoryGirl.create(:activity) }
      let(:garden) { FactoryGirl.create(:garden) }
    end

    it ' creates a garden activity' do
      binding.pry
      my_activity = GardenActivity.new(activity_id: activity.id, garden_id: garden.id, notes: "blah blah", weather: "Hot", date_performed: Time.now)
      binding.pry
      expect(my_activity).to be_valid
    end
  end

end
