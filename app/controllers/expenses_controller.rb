class ExpensesController < ApplicationController
  include Authenticable
  include ApiCommunicator

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:success] = 'Saved!'
    else
      flash[:error] = 'Error while saving expense'
    end
    redirect_to root_path
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      flash[:success] = 'Saved!'
    else
      flash[:error] = 'Error while saving expense'
    end
    redirect_to root_path
  end

  private

    def expense_params
      params.require(:expense).permit(:id, :invoice_id, :description, :expense)
    end

end
