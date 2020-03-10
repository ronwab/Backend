# frozen_string_literal: true

require 'rails_helper'
RSpec.describe GardensController, type: :controller do
  describe 'get index' do
    it ' should return the correct number of objects ' do
      @mygarden = FactoryGirl.create(:garden)
      get :index, format: :json
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(response_body.size).to eq(1)
      expect(response_body.first['plant_name']).to eq(@mygarden.plant_name)
    end
    it 'should error out if there are no gardens' do
      get :index, format: :json
      expect(response.status).to eq(200)
      expect(response.body).to eq('[]')
    end
  end
  describe 'Create a new garden' do
    it 'should create a new garden' do
      expect do
        post :create, format: :json,
                      params: { plant_name: 'Cucumber', date_planted: Time.now, rows: 2,
                                spacing: 4, notes: 'Kill my boss? Do I dare live out' }
      end.to change { Garden.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
  describe 'Delete the garden' do
    let!(:garden) { FactoryGirl.create(:garden) }
    it 'should delete a single garden' do
      expect { delete :destroy, params: { id: garden.id } }.to change(Garden, :count).by(-1)
      expect(response.status).to eq(200)
    end
    it 'should throw error if record does not exist' do
      delete :destroy, params: { id: 9_999_999 }
      expect(response.body).to include("Couldn't find Garden with 'id'=9999999")
      expect(response.status).to eq(422)
    end
  end
  describe 'Show garden' do
    let!(:garden) { FactoryGirl.create(:garden) }
    it 'should display returned garden ' do
      get :show, format: :json, params: { id: garden.id }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['plant_name']).to eq(garden.plant_name)
    end
    it 'should throw an error if no garden is returned' do
      patch :update, params: { id: 34_234_234 }
      expect(response.status).to eq(422)
      expect(JSON.parse(response.body)['error']).to include("Couldn't find Garden with 'id'=34234234")
    end
  end
  describe 'Search for garden ' do
    let!(:garden) { FactoryGirl.create(:garden) }
    it 'should return a garden' do
      get :search_gardens, params: { search: garden.plant_name }, format: :json
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)[0]['plant_name']).to eq(garden.plant_name)
    end
    it 'should error when no garden is found' do
      get :search_gardens, params: { search: 'I dont exist' }, format: :json
      expect(response.status).to eq(404)
      expect(JSON.parse(response.body)['message']).to eq('Record does not exists')
    end
  end
end
