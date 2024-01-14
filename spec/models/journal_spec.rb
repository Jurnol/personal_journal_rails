require 'rails_helper'

RSpec.describe Journal, type: :model do
  describe "instance methods" do
    it "increments entry count each time an entry is created" do 
      user = create(:user)
      journal = create(:journal, user: user)

      expect(journal.entry_count).to eq(0)
      
      entry = create(:entry, journal: journal)

      expect(journal.entry_count).to eq(1)
    end

    it "decreases the entry count when an entry is deleted" do 
      user = create(:user)
      journal = create(:journal, user: user)      
      entry = create(:entry, journal: journal)

      expect(journal.entry_count).to eq(1)

      entry.destroy
      
      expect(journal.entry_count).to eq(0)
    end
  end

end
