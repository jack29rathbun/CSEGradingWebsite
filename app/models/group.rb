class Group < ApplicationRecord
  has_many :students
  has_many :evaluations, through: :students
  validates :name, presence: true
end
