class SurveyResult < ApplicationRecord
  belongs_to :survey
  has_many :question_responses
end
