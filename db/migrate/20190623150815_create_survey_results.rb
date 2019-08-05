class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.references :survey, foreign_key: true
      t.string :uuid
    end
  end
end
