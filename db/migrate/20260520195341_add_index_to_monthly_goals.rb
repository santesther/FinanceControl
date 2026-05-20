class AddIndexToMonthlyGoals < ActiveRecord::Migration[8.1]
  def up
    add_index :monthly_goals, [ :user_id, :month, :year ], unique: true
  end

  def down
  end
end
