class Interval < ApplicationRecord
  validates :start_time, presence: true
  belongs_to :survey_result
end