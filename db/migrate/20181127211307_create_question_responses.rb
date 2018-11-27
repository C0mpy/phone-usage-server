class CreateQuestionResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :question_responses do |t|
      t.string :user
      t.integer :response
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
