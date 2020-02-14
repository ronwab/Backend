# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FertilizersController, type: :controller do
  describe 'Perform search' do
    let!(:fertilizer) { FactoryGirl.create(:fertilizer) }

    it 'should successfully find fertilizer' do
      get :search_fertilizer, params: { fertilizer_name: fertilizer.fertilizer_name }, format: :json

      expect(response_json[:fertilizer_name]).to eq(fertilizer.fertilizer_name)
      expect(response.status).to eq(200)
    end
    it 'should return an error if fertilizer is not found' do
      get :search_fertilizer, params: { fertilizer_name: 'I Dont exist' }, format: :json

      expect(response_json).to eq(message: 'No results found Please enter another value')
      expect(response.status).to eq(404)
    end
    it 'should search uppercase successfully' do
      fertilizer_name_downcase = fertilizer.fertilizer_name.downcase
      get :search_fertilizer, params: { fertilizer_name: fertilizer_name_downcase }, format: :json

      expect(response_json[:fertilizer_name]).to eq(fertilizer_name_downcase)
      expect(response.status).to eq(200)
    end

    it 'should search lowercase successfully' do
      fertilizer_name_upcase = fertilizer.fertilizer_name.upcase
      get :search_fertilizer, params: { fertilizer_name: fertilizer_name_upcase }, format: :json

      expect(response_json[:fertilizer_name]).to eq(fertilizer_name_upcase.downcase)
      expect(response.status).to eq(200)
    end
  end
  describe 'find all fertilizers' do
    let!(:fertilizer1) { FactoryGirl.create(:fertilizer) }
    let!(:fertilizer2) { FactoryGirl.create(:fertilizer) }
    let!(:fertilizer3) { FactoryGirl.create(:fertilizer) }
    let!(:fertilizer4) { FactoryGirl.create(:fertilizer) }
    let!(:fertilizer5) { FactoryGirl.create(:fertilizer) }
    it ' should show all fertilizers' do
      get :index, format: :json,
                  params: { page: 1, per_page: 5 }
      binding.pry
      expect(response.status).to eq(200)
      expect(response.body).to eq(5)

      # binding.pry
    end
  end
  describe 'create a fertilizer' do
    it 'should create  new fertilizer' do
      expect do
        post :create, format: :json,
                      params: { fertilizer_name: 'europium', date_bought: '2019-10-29', quantity: 26 }
      end.to change { Fertilizer.count }.by(1)

      expect(response.status).to eq(201)
    end
  end
  describe 'delete fertilizer' do
    let!(:fertilizer) { FactoryGirl.create(:fertilizer) }
    it 'should delete an existing fertilizer' do
      expect do
        delete :destroy, format: :json,
                         params: { id: fertilizer.id }
      end.to change { Fertilizer.count }.by(-1)
      # binding.pry
      expect(response.status).to eq(200)
      expect(request.body).to include("Record with id #{fertilizer.id} destroyed") # Why am I not getting
    end
    it 'should error if fertilizer is not found' do
      delete :destroy, params: { id: 3_333_333 }
      expect(response.status).to eq(422)
      expect(response.body).to include("Couldn't find Fertilizer with 'id'=3333333")
    end
    it 'should error if user does not provide id' do
      delete :destroy, params: { id: '' }
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
