require "test_helper"

class MonthlyGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_goal = monthly_goals(:one)
  end

  test "should get index" do
    get monthly_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_goal_url
    assert_response :success
  end

  test "should create monthly_goal" do
    assert_difference("MonthlyGoal.count") do
      post monthly_goals_url, params: { monthly_goal: { current_balance: @monthly_goal.current_balance, month: @monthly_goal.month, savings_target: @monthly_goal.savings_target, spending_limit: @monthly_goal.spending_limit, user_id: @monthly_goal.user_id, year: @monthly_goal.year } }
    end

    assert_redirected_to monthly_goal_url(MonthlyGoal.last)
  end

  test "should show monthly_goal" do
    get monthly_goal_url(@monthly_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_goal_url(@monthly_goal)
    assert_response :success
  end

  test "should update monthly_goal" do
    patch monthly_goal_url(@monthly_goal), params: { monthly_goal: { current_balance: @monthly_goal.current_balance, month: @monthly_goal.month, savings_target: @monthly_goal.savings_target, spending_limit: @monthly_goal.spending_limit, user_id: @monthly_goal.user_id, year: @monthly_goal.year } }
    assert_redirected_to monthly_goal_url(@monthly_goal)
  end

  test "should destroy monthly_goal" do
    assert_difference("MonthlyGoal.count", -1) do
      delete monthly_goal_url(@monthly_goal)
    end

    assert_redirected_to monthly_goals_url
  end
end
