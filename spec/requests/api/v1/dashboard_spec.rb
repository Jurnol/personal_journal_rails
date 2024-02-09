require 'rails_helper'

RSpec.describe "Dashboard enpoint" do 
  describe "retrieving user info once logged in" do
    it "return proper user information when a get request is sent using a bearer token" do 
      @user_1 = User.create!(first_name: "person", last_name: "person", email: "person@gmail.com", password: "123", password_confirmation: "123")
      @journal = create(:journal, user_id: @user_1.id)
      post "/api/v1/login", params: {userData: {email: "person@gmail.com", password: "123"} }

      expect(response).to be_successful
      expect(response.status).to be(200)
      
      response_body = JSON.parse(response.body, symbolize_names: true)
      # require 'pry';binding.pry
      token = response_body[:token]

      get "/api/v1/journals", headers: { Authorization: "Bearer #{token} "}

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body).to have_key(:user_info)
      user_info = response_body[:user_info]
      expect(user_info).to have_key(:email)
      expect(user_info[:email]).to eq(@user_1.email)
      expect(user_info).to have_key(:first_name)
      expect(user_info[:first_name]).to eq(@user_1.first_name)
      expect(user_info).to have_key(:last_name)
      expect(user_info[:last_name]).to eq(@user_1.last_name)

      expect(response_body).to have_key(:user_journals)
      expect(response_body[:user_journals]).to be_a(Array)
      # require 'pry';binding.pry
    end

    it "returns an error if the incorrect token or no token is provided" do 
      get "/api/v1/journals", headers: { Authorization: "Bearer notatoken "}

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body[:error]).to eq("Unauthorized")
    end
  end
end