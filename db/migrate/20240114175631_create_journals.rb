class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.string :title
      t.string :status, default: 1
      t.integer :entry_count, default: 0
      t.string :image
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
