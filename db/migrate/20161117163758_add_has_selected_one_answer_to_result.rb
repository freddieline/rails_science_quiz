class AddHasSelectedOneAnswerToResult < ActiveRecord::Migration[5.0]
  def change
    add_column :result, :hasSelectedOneAnswer, :boolean
  end
end
