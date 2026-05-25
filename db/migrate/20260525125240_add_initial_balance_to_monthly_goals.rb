class AddInitialBalanceToMonthlyGoals < ActiveRecord::Migration[8.1]
  def change
    add_column :monthly_goals, :initial_balance, :decimal
  end
end
