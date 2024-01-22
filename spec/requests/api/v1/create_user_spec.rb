require 'rails_helper'

RSpec.describe "Create an account endpoint" do
  describe "creating a user" do 
    it "can create a user in the database" do 
      post "/api/v1/register", params: {
        user: {
          first_name: "Antoine",
          last_name: "Aube",
          email: "person@gmail.com",
          password: "password",
          password_confirmation: "password"
        }
      }
      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      expect(User.count).to eq(1)
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:message]).to eq("Account successfully created")
    end
  end
end