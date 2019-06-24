class CreateSurveyResultsIntervals < ActiveRecord::Migration[5.2]
    def change
      create_table :survey_results_intervals do |t|
        t.references :interval, foreign_key: true
        t.references :survey_result, foreign_key: true
      end
    end
  end