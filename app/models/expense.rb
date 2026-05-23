class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  after_create :check_spending_limit

  private

  def check_spending_limit
    goal = MonthlyGoal.find_by(user_id: user_id, month: date.month, year: date.year)
    return unless goal

    pct = goal.percentage_spent

    if pct >= 100
      create_alert(goal, "limit_exceeded", "Você ultrapassou o limite mensal de gastos!")
    elsif pct >= 80
      create_alert(goal, "limit_warning", "Você atingiu #{pct.to_i}% do seu limite mensal.")
    end
  end

  def create_alert(goal, type, message)
  already_exists = Alert.exists?(
    user_id: user_id,
    alert_type: type,
    created_at: Date.new(goal.year, goal.month).all_month
  )
  return if already_exists

  Alert.create(
    user_id: user_id,
    expense_id: id,
    alert_type: type,
    message: message,
    channel: user.notification_channel.presence || "app",
    status: "pending"
  )
  end

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :description, presence: true
end
