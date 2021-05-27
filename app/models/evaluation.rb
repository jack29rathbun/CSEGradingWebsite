class Evaluation < ApplicationRecord
    belongs_to :student
    belongs_to :group
    validates :evaluator, presence: true
    validates :evaluatee, presence: true
    validates :project, presence: true
    validates :score, presence: true
    validates :comments, presence: true
end
