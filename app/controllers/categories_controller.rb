class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:expense_categories).where(author: current_user).order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
    @category_expense = ExpenseCategory.includes(:expense).where(category: @category).order(created_at: :desc)
    @total_amt = @category_expense.reduce(0) { |sum, obj| sum + obj.expense.amount }
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user
    return unless @category.save

    redirect_to categories_path
  end

  private
  
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
