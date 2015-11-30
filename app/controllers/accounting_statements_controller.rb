class AccountingStatementsController < ApplicationController
  before_action :set_accounting_statement, only: [:show, :edit, :update, :destroy]

  # GET /accounting_statements
  def index
    @accounting_statements = AccountingStatement.all
  end

  # GET /accounting_statements/1
  def show
  end

  # GET /accounting_statements/new
  def new
    @accounting_statement = AccountingStatement.new
  end

  # GET /accounting_statements/1/edit
  def edit
  end

  def front_image
    statement = AccountingStatement.find params[:id]
    send_data statement.frontpage_data, type: statement.frontpage_content_type, disposition: 'inline'
  end

  def back_image
    statement = AccountingStatement.find params[:id]
    send_data statement.backpage_data, type: statement.backpage_content_type, disposition: 'inline'
  end





  # POST /accounting_statements
  def create
    new_params = converted_float_params
    new_params = assign_image_data(new_params)
    @accounting_statement = AccountingStatement.new(new_params)
    if @accounting_statement.save
      redirect_to @accounting_statement, notice: 'Accounting statement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accounting_statements/1
  def update    
    new_params = converted_float_params
    new_params = assign_image_data(new_params)
    if @accounting_statement.update_attributes(new_params)
      redirect_to @accounting_statement, notice: 'Accounting statement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounting_statements/1
  def destroy
    @accounting_statement.destroy
    redirect_to accounting_statements_url, notice: 'Accounting statement was successfully destroyed.'
  end



  private
  
  def is_float_key?(param_key)
    if param_key == "net_amount" or param_key == "vat_amount"
      return true
    else
      return false
    end
  end




  def assign_image_data(new_params)
    ["frontpage_data", "backpage_data"].each do |file_key|
      if new_params[file_key]
        new_params[file_key.split("_").first + "_content_type"] = new_params[file_key].content_type 
        new_params[file_key.split("_").first + "_filename"] = new_params[file_key].original_filename
        new_params[file_key.split("_").first + "_data"] = new_params[file_key].tempfile.read
      end      
    end
    new_params
  end

  
  def converted_float_params
    new_params = {}
    accounting_statement_params.keys.each do |accounting_param_key|
      if is_float_key?(accounting_param_key)
        new_params[accounting_param_key] = accounting_statement_params[accounting_param_key].gsub(',', '.').to_f
      else
        new_params[accounting_param_key] = accounting_statement_params[accounting_param_key]
      end
    end    
    new_params
  end
  
  
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_statement
      @accounting_statement = AccountingStatement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def accounting_statement_params
      params.require(:accounting_statement).permit(:is_income, :net_amount, :vat_amount, :frontpage_data, :backpage_data, :frontpage_content_type, :backpage_content_type, :backpage_filename, :frontpage_filename, :bill_number, :issuedate, :payment_date, :description, :physical_location, :receiver_or_issuer_name, :accounting_category_id, :corporation_id)
    end
end
