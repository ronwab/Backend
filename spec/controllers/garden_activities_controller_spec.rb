# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GardenActivitiesController, type: :controller do
  describe 'it returns all garden activities' do
    it 'should return all activities' do
      let!
    end
  end

  describe ' it shows only one record' do
  end
  describe ' it should create a new activity' do
    let (:garden) { FactoryGirl.create(:garden) }
    it 'creates a new garden activity' do
      expect do
        post :create, format: :json,
             params: {garden_id: garden.id, date_performed: "2020-02-19", activity_id: "", time: "Morning", weather: "Hot", notes: "minus activity"}
      end.to change { GardenActivity.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
  describe 'it should delete one activity' do
  end
end
