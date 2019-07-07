class Survey < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :interval, presence:true
  has_many :questions
end
