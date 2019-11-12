require 'rails_helper'

RSpec.describe GardenActivity, type: :model do


  describe ' create garden activity' do

    before(:each) do
      let(:activity) { FactoryGirl.create(:activity) }
      let(:garden) { FactoryGirl.create(:garden) }
    end

    it ' creates a garden activity' do
      my_activity = GardenActivity.new(activity_id: a_id, garden_id: g_id, notes: "blah blah", weather: "Hot", date_performed: Time.now)

      expect(my_activity).to be_valid
    end
  end

end
