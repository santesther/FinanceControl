class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]

  # GET /expenses or /expenses.json
  def index
  @expenses = current_user.expenses.includes(:category).order(date: :desc)
  end

  # GET /expenses/1 or /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        pending_alert = current_user.alerts.where(status: "pending").order(created_at: :desc).first
        if pending_alert
          format.html { redirect_to expenses_path, alert: pending_alert.message, status: :see_other }
          format.json { render :show, status: :created, location: @expense }
        else
          format.html { redirect_to expenses_path, notice: "Despesa registrada com sucesso.", status: :see_other }
          format.json { render :show, status: :created, location: @expense }
        end
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @expense.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: "Expense was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @expense.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy!

    respond_to do |format|
      format.html { redirect_to expenses_path, notice: "Expense was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.expect(expense: [ :user_id, :category_id, :description, :amount, :date ])
    end
end
