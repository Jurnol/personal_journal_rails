class Journal < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy

  enum status: { inactive: 0, active: 1 }

  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :entry_count, numericality: { greater_than_or_equal_to: 0}
  validates :description, length: { maximum: 500}

  def increment_entry_count
    update(entry_count: entry_count + 1)
  end

  def decrement_entry_count
    update(entry_count: entry_count - 1)
  end

end
