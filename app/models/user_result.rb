class UserResult < ApplicationRecord
  belongs_to :survey_result
  has_many :phone_usages
  validates :user_uuid, presence: true
  validates :period_start, presence: true
  validates :period_end, presence: true
end