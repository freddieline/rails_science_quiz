class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :name
      t.integer :score
      t.integer :total
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
