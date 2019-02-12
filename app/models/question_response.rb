class QuestionResponse < ApplicationRecord
  has_one :question, required: true
  validates :response, presence: true
  belongs_to :survey_result
end
