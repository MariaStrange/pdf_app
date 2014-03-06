require 'test_helper'

class DiplomsControllerTest < ActionController::TestCase
  setup do
    @diplom = diploms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diploms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diplom" do
    assert_difference('Diplom.count') do
      post :create, diplom: { amount: @diplom.amount, name: @diplom.name }
    end

    assert_redirected_to diplom_path(assigns(:diplom))
  end

  test "should show diplom" do
    get :show, id: @diplom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diplom
    assert_response :success
  end

  test "should update diplom" do
    patch :update, id: @diplom, diplom: { amount: @diplom.amount, name: @diplom.name }
    assert_redirected_to diplom_path(assigns(:diplom))
  end

  test "should destroy diplom" do
    assert_difference('Diplom.count', -1) do
      delete :destroy, id: @diplom
    end

    assert_redirected_to diploms_path
  end
end
