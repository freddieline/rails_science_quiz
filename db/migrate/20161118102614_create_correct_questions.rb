class CreateCorrectQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :correct_questions do |t|
      t.string :question
      t.string :answer
      t.references :result, foreign_key: true

      t.timestamps
    end
  end
end
