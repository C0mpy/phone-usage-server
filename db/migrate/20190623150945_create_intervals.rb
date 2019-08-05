class CreateIntervals < ActiveRecord::Migration[5.2]
  def change
    create_table :intervals do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :survey_result, foreign_key: true
    end
  end
end
  