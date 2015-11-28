require 'test_helper'

class AccountingCategoriesControllerTest < ActionController::TestCase
  setup do
    @accounting_category = accounting_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_category" do
    assert_difference('AccountingCategory.count') do
      post :create, accounting_category: { name: @accounting_category.name }
    end

    assert_redirected_to accounting_category_path(assigns(:accounting_category))
  end

  test "should show accounting_category" do
    get :show, id: @accounting_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_category
    assert_response :success
  end

  test "should update accounting_category" do
    patch :update, id: @accounting_category, accounting_category: { name: @accounting_category.name }
    assert_redirected_to accounting_category_path(assigns(:accounting_category))
  end

  test "should destroy accounting_category" do
    assert_difference('AccountingCategory.count', -1) do
      delete :destroy, id: @accounting_category
    end

    assert_redirected_to accounting_categories_path
  end
end
