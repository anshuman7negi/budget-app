class ExpensesController < ApplicationController
    def new
        @expense = Expense.new
        @categories = Category.where(author: current_user)
      end
    
      def create
        @expense = Expense.new(expense_params)
        @expense.author = current_user
        return unless @expense.save
    
        ExpenseCategory.create!(expense_id: @expense.id, category_id: params[:category])
        redirect_to category_path(params[:category])
      end
    
      protected
    
      def expense_params
        params.require(:expense).permit(:name, :amount, :category)
      end
end
