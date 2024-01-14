class ChangeStatusTypeInJournals < ActiveRecord::Migration[7.0]
  def up
    change_column :journals, :status, 'integer USING CAST(status AS integer)'
  end

  def down
    change_column :journals, :status, :string
  end
end
