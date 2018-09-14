class CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    load_support
  end

  def create
    category = Category.new category_params
    if category.save
      flash[:notice] = "Created"
      redirect_to categories_path
    else
      load_support
      flash[:alert] = "Failed"
      render :new
    end
  end

  def edit
    load_support
  end

  def update
    if @category.update category_params
      flash[:notice] = "Updated"
      redirect_to categories_path
    else
      load_support
      flash[:alert] = "Failed"
      render :new
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Deleted"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit Category::UPDATABLE_ATTRIBUTES
  end

  def load_category
    @category = Category.find params[:id]
  end

  def load_support
    @support = CategorySupport.new @category
  end
end
