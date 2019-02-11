class QuestionResponse < ApplicationRecord
  has_one :question
  validates :response, presence: true
  belongs_to :survey_result
end
