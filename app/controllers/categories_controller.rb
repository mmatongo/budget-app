class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: [:show]

  def index
    @categories = current_user.categories.order(:name)
  end

  def new
    @category = Category.new
  end

  def show
    @payments = @category.payments.order(created_at: 'desc')
  end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  def set_category
    @category = Category.includes(:payments).find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
