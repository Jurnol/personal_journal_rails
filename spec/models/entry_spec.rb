require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "relationships and validations" do 
    it { should belong_to(:journal) }
    it { should validate_presence_of :title}
    it { should validate_length_of(:title).is_at_most(150)}
    it { should validate_presence_of(:journal_id)}
    it { should validate_presence_of(:entry_date)}
  end
end
