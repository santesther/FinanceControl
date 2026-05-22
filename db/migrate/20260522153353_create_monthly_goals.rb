class CreateMonthlyGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :monthly_goals, force: :cascade do |t|
      t.integer :user_id
      t.integer :year
      t.integer :month
      t.decimal :savings_target
      t.decimal :spending_limit
      t.decimal :current_balance

      t.timestamps
    end
  end
end
