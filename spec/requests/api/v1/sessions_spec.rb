require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "POST create a session" do
    it "creates a session and return a JWT token for the user session" do 
      @user_1 = User.create!(first_name: "guy", last_name: "fieri", email: "guy@gmail.com", password: "guy", password_confirmation: "guy")
      post "/api/v1/login", params: {email: "guy@gmail.com", password: "guy"}
      

      expect(response).to be_successful
      expect(response.status).to be(200)
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:token)

      token = response_body[:token]

      decoded_token = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, { algorithm: "HS256" })
      require 'pry';binding.pry
      expect(decoded_token.first["user_id"]).to eq(@user_1.id)
    end

    it "returns an error message if the wrong password is entered" do 
      @user_1 = User.create!(first_name: "guy", last_name: "fieri", email: "guy@gmail.com", password: "guy", password_confirmation: "guy")
      post "/api/v1/login", params: {email: "guy@gmail.com", password: "wrongpassword"}

      expect(response).to_not be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to eq("Invalid Credentials")

    end
  end
end
