json.extract! monthly_goal, :id, :user_id, :year, :month, :savings_target, :spending_limit, :current_balance, :created_at, :updated_at
json.url monthly_goal_url(monthly_goal, format: :json)
