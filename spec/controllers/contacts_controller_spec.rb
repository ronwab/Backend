require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'Create' do
    let!(:contact) { FactoryGirl.create(:contact) }
    it 'creates a new message' do

      expect do
        post :create, format: :json,
             params: {first_name: "Ron", last_name: "wab", email: "ronald.wabukenda@gmail.com", subject: "Test create email", comment: "Blah blah blah blah"}
      end.to change { Contact.count }.by(1)
      expect(response.status).to eq(201)
      # expect(response_json[:first_name]).to eq(params.first_name)
    end
  end
end