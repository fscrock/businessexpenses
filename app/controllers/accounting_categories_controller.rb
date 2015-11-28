class AccountingCategoriesController < ApplicationController
  before_action :set_accounting_category, only: [:show, :edit, :update, :destroy]

  # GET /accounting_categories
  def index
    @accounting_categories = AccountingCategory.all
  end

  # GET /accounting_categories/1
  def show
  end

  # GET /accounting_categories/new
  def new
    @accounting_category = AccountingCategory.new
  end

  # GET /accounting_categories/1/edit
  def edit
  end

  # POST /accounting_categories
  def create
    @accounting_category = AccountingCategory.new(accounting_category_params)

    if @accounting_category.save
      redirect_to @accounting_category, notice: 'Accounting category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accounting_categories/1
  def update
    if @accounting_category.update_attributes(accounting_category_params)
      redirect_to @accounting_category, notice: 'Accounting category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounting_categories/1
  def destroy
    @accounting_category.destroy
    redirect_to accounting_categories_url, notice: 'Accounting category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_category
      @accounting_category = AccountingCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def accounting_category_params
      params.require(:accounting_category).permit(:name)
    end
end
