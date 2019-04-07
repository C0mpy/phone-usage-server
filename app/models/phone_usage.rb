class UserResult < ApplicationRecord
  belongs_to :user_result
  validates :start_time, presence: true
  validates :end_time, presence: true
end