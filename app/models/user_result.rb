class UserResult < ApplicationRecord
  belongs_to :survey_result
  validates :user_uuid, presence: true
  validates :time_spent_on_phone, presence: true
  validates :period_start, presence: true
  validates :period_end, presence: true
end