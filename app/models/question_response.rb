class QuestionResponse < ApplicationRecord
  belongs_to :question
  belongs_to :survey_result
  validates :response, presence: true
end
