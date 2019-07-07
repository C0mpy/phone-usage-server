class Interval < ApplicationRecord
  validates :start_time, presence: true
  has_many :surveys
end