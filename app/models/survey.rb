class Survey < ApplicationRecord
  has_many :questions
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
