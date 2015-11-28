require 'test_helper'

class AccountingStatementsControllerTest < ActionController::TestCase
  setup do
    @accounting_statement = accounting_statements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_statements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_statement" do
    assert_difference('AccountingStatement.count') do
      post :create, accounting_statement: { accounting_category_id: @accounting_statement.accounting_category_id, backpage_content_type: @accounting_statement.backpage_content_type, backpage_data: @accounting_statement.backpage_data, backpage_filename: @accounting_statement.backpage_filename, bill_number: @accounting_statement.bill_number, corporation_id: @accounting_statement.corporation_id, description: @accounting_statement.description, frontpage_content_type: @accounting_statement.frontpage_content_type, frontpage_data: @accounting_statement.frontpage_data, frontpage_filename: @accounting_statement.frontpage_filename, is_income: @accounting_statement.is_income, issuedate: @accounting_statement.issuedate, net_amount: @accounting_statement.net_amount, payment_date: @accounting_statement.payment_date, physical_location: @accounting_statement.physical_location, receiver_or_issuer_name: @accounting_statement.receiver_or_issuer_name, vat_amount: @accounting_statement.vat_amount }
    end

    assert_redirected_to accounting_statement_path(assigns(:accounting_statement))
  end

  test "should show accounting_statement" do
    get :show, id: @accounting_statement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_statement
    assert_response :success
  end

  test "should update accounting_statement" do
    patch :update, id: @accounting_statement, accounting_statement: { accounting_category_id: @accounting_statement.accounting_category_id, backpage_content_type: @accounting_statement.backpage_content_type, backpage_data: @accounting_statement.backpage_data, backpage_filename: @accounting_statement.backpage_filename, bill_number: @accounting_statement.bill_number, corporation_id: @accounting_statement.corporation_id, description: @accounting_statement.description, frontpage_content_type: @accounting_statement.frontpage_content_type, frontpage_data: @accounting_statement.frontpage_data, frontpage_filename: @accounting_statement.frontpage_filename, is_income: @accounting_statement.is_income, issuedate: @accounting_statement.issuedate, net_amount: @accounting_statement.net_amount, payment_date: @accounting_statement.payment_date, physical_location: @accounting_statement.physical_location, receiver_or_issuer_name: @accounting_statement.receiver_or_issuer_name, vat_amount: @accounting_statement.vat_amount }
    assert_redirected_to accounting_statement_path(assigns(:accounting_statement))
  end

  test "should destroy accounting_statement" do
    assert_difference('AccountingStatement.count', -1) do
      delete :destroy, id: @accounting_statement
    end

    assert_redirected_to accounting_statements_path
  end
end
