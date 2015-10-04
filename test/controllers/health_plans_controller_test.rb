require 'test_helper'

class HealthPlansControllerTest < ActionController::TestCase
  setup do
    @health_plan = health_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:health_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create health_plan" do
    assert_difference('HealthPlan.count') do
      post :create, health_plan: { name: @health_plan.name }
    end

    assert_redirected_to health_plan_path(assigns(:health_plan))
  end

  test "should show health_plan" do
    get :show, id: @health_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @health_plan
    assert_response :success
  end

  test "should update health_plan" do
    patch :update, id: @health_plan, health_plan: { name: @health_plan.name }
    assert_redirected_to health_plan_path(assigns(:health_plan))
  end

  test "should destroy health_plan" do
    assert_difference('HealthPlan.count', -1) do
      delete :destroy, id: @health_plan
    end

    assert_redirected_to health_plans_path
  end
end
