
require 'rails_helper'

RSpec.describe GardenActivitiesController, type: :controller do
  let!(:garden_activity) { FactoryGirl.create(:garden_activity) }
  describe 'basic controller functions' do
    it ' should get index' do
      get :index, format: :json
      expect(response.status).to eq(200)
    end
  end
end
