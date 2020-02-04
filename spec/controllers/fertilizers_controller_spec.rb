# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FertilizersController, type: :controller do
  describe 'Perform search' do
    let(:fertilizer) { FactoryGirl.create(:fertilizer) }
    it 'should successfully find fertilizer' do
      # binding.pry
      expect(response_json[:data].fertilizer_name).to eq(fertilizer.fertilizer_named)
    end
  end
  describe 'find all fertilizers' do
    let!(:fertilizer) { FactoryGirl.create(:fertilizer) }
    it ' should show all fertilizers' do
      get :index, format: :json
      expect(response.status).to eq(200)
    end
  end
  describe 'create a fertilizer' do
    it 'should create  new fertilizer' do
      expect do
        post :create, format: :json,
             params: {fertilizer_name: 'europium', date_bought: '2019-10-29', quantity: 26}
      end.to change { Fertilizer.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
  describe 'delete fertilizer' do
    let!(:fertilizer) { FactoryGirl.create(:fertilizer) }
    it 'should delete an existing fertilizer' do
      expect do
        delete :destroy, format: :json,
               params: {id: fertilizer.id}
      end.to change { Fertilizer.count }.by(-1)
      binding.pry
      expect(response.status).to eq(200)
      expect(request.body).to include("Record with id #{fertilizer.id} destroyed") # Why am I not getting
    end
    it 'should error if fertilizer is not found' do
      delete :destroy, params: {id: 3_333_333}
      expect(response.status).to eq(422)
      expect(response.body).to include("Couldn't find Fertilizer with 'id'=3333333")
    end
    it 'should error if user does not provide id' do
      delete :destroy, params: {id: ''}
      expect(response.status).to eq(422)
      expect(response.body).to include("Couldn't find Fertilizer with 'id'")


    end
  end
  describe 'show fertilizer' do
    let(:fertilizer) { FactoryGirl.create(:fertilizer) }
    it ' should display single record' do
      get :show, format: :json, params: { id: fertilizer.id }
      expect(response.status).to eq(200)
    end
  end
end

