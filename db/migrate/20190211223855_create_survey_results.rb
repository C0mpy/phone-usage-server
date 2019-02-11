class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.string :survey_id
      t.string :user_uuid
      t.references :question_responses, foreign_key: true
    end
  end
end
