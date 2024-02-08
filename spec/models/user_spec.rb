require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships and validations" do 
    it { should have_many(:journals) }
    it { should have_many(:entries).through(:journals)}
    
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:password_confirmation)}
  end
end
