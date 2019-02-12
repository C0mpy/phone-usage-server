class SurveyResult < ApplicationRecord
  belongs_to :survey, required: true
  validates :user_uuid, presence: true
end
