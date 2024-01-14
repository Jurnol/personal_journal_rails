class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :journal, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.date :entry_date

      t.timestamps
    end
  end
end
