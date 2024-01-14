class Entry < ApplicationRecord
  belongs_to :journal

  validates :title, presence: true, length: {maximum: 150}
  validates :journal_id, presence: true
  validates :entry_date, presence: true

  after_create :increment_journal_entries
  after_destroy :decrease_journal_entries


  def increment_journal_entries
    journal.increment_entry_count
  end

  def decrease_journal_entries
    journal.decrement_entry_count
  end
end
