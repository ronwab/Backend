# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GardenActivitiesController, type: :controller do
  describe 'it returns all garden activities' do
    it 'should return all activities' do
    end
  end

  describe ' Show method' do
    let(:garden_activity) { FactoryGirl.create(:garden_activity) }

    it 'should return one Garden Acvitity' do
      get :show, format: :json,
                 params: { id: garden_activity.id }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['activity']).to eq(garden_activity.activity)
    end

    it 'should return error message when no activity is found' do
      get :show, format: :json,
                 params: { id: 34_234_234 }
      expect(response.status).to eq(404)
      expect(JSON.parse(response.body)['error']).to include("Couldn't find GardenActivity with 'id'=34234234")
    end
  end
  describe ' it should create a new activity' do
    let (:garden) { FactoryGirl.create(:garden) }
    it 'creates a new garden activity' do
      expect do
        post :create, format: :json,
                      params: { garden_id: garden.id, date_performed: '2020-02-19', activity_id: '', time: 'Morning', weather: 'Hot', notes: 'minus activity' }
      end.to change { GardenActivity.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
  describe 'it should delete one activity' do
  end
end
