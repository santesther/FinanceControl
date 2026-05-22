class MonthlyGoal < ApplicationRecord
   belongs_to :user

  validates :month, presence: true, inclusion: { in: 1..12 }
  validates :year, presence: true, numericality: { only_integer: true }
  validates :savings_target, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :current_balance, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :spending_limit, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :month, uniqueness: { scope: [ :user_id, :year ] }
end
