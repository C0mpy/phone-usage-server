class Survey < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :questions
  has_many :survey_intervals
  has_many :intervals, through: :survey_intervals
end
