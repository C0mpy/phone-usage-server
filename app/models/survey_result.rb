class SurveyResult < ApplicationRecord
  validates :survey_id, presence: true
  validates :user_uuid, presence: true
end
