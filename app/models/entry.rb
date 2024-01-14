class Entry < ApplicationRecord
  belongs_to :journal

  validates :title, presence: true, length: {maximum: 150}
  validates :journal_id, presence: true
  validates :entry_date, presence: true
end
