class Survey < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :questions
  validates :start_time, presence: true
end
