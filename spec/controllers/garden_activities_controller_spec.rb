
require 'rails_helper'

RSpec.describe GardenActivitiesController, type: :controller do
  let!(:garden_activity) { FactoryGirl.create(:garden_activity) }
  describe 'basic controller functions' do
    it ' should get index' do
      # binding.pry

      get :index
      # expect
    end
  end
end
