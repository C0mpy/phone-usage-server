class UserResult < ApplicationRecord
  belongs_to :survey_result
  validates :user_uuid, presence: true
  has_many :phone_usage
  validates :period_start, presence: true
  validates :period_end, presence: true
end