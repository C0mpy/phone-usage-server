class CreateSurveyIntervals < ActiveRecord::Migration[5.2]
    def change
      create_table :survey_intervals do |t|
        t.references :survey, foreign_key: true
        t.references :interval, foreign_key: true
  
        t.timestamps
      end
    end
end
  