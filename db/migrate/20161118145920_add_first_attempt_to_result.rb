class AddFirstAttemptToResult < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :first_attempt, :boolean
  end
end
