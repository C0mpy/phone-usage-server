class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.references :survey
      t.string :user_uuid
    end
  end
end
