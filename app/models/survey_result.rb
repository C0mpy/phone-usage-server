class SurveyResult < ApplicationRecord
  belongs_to :survey
  validates :user_uuid, presence: true
  has_many :question_responses
  has_many :intervals
end
