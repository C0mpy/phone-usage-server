class Interval < ApplicationRecord
  belongs_to :survey_result, class_name: 'SurveyResult', foreign_key: 'survey_result_id'
  validates :start_time, presence: true
end