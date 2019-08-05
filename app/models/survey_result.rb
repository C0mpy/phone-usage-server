class SurveyResult < ApplicationRecord
  belongs_to :survey
  validates :uuid, presence: true
  has_many :question_responses
  has_many :intervals, dependent: :destroy
end
