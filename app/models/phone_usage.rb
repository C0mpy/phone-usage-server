class PhoneUsage < ApplicationRecord
  belongs_to :user_result, class_name: 'UserResult', foreign_key: 'user_result_id'
  validates :start_time, presence: true
  validates :end_time, presence: true
end