require 'test_helper'

class SuppliersControllerTest < ActionController::TestCase
  setup do
    @supplier = suppliers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post :create, supplier: { account_id: @supplier.account_id, active: @supplier.active, email: @supplier.email, frecuency: @supplier.frecuency, name: @supplier.name, note: @supplier.note, ranking: @supplier.ranking, telefone: @supplier.telefone, url: @supplier.url, watcher_unit_id: @supplier.watcher_unit_id }
    end

    assert_redirected_to supplier_path(assigns(:supplier))
  end

  test "should show supplier" do
    get :show, id: @supplier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier
    assert_response :success
  end

  test "should update supplier" do
    patch :update, id: @supplier, supplier: { account_id: @supplier.account_id, active: @supplier.active, email: @supplier.email, frecuency: @supplier.frecuency, name: @supplier.name, note: @supplier.note, ranking: @supplier.ranking, telefone: @supplier.telefone, url: @supplier.url, watcher_unit_id: @supplier.watcher_unit_id }
    assert_redirected_to supplier_path(assigns(:supplier))
  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete :destroy, id: @supplier
    end

    assert_redirected_to suppliers_path
  end
end
