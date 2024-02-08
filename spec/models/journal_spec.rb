require 'rails_helper'

RSpec.describe Journal, type: :model do
  describe "relationships and validations" do 
    let(:user) { create(:user) } 
      
    before do
      create(:journal, title: "Unique Title", user: user) # Create an existing record to test against.
    end

    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id).with_message("You've already used this title for another journal") }
    it { should validate_numericality_of(:entry_count).is_greater_than_or_equal_to(0) }
    it { should validate_length_of(:description).is_at_most(500) }

    it { should belong_to(:user) }
    it { should have_many(:entries).dependent(:destroy) }

    it "should not allow you to create a journal that has a duplicate title" do 
      new_journal = build(:journal, title: "Unique Title", user: user)
      new_journal.valid?
      expect(new_journal.errors[:title]).to include("You've already used this title for another journal")
    end
  end

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
