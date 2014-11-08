require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get team" do
    get :team
    assert_response :success
  end

  test "should get faqs" do
    get :faqs
    assert_response :success
  end

  test "should get terms_and_conditions" do
    get :terms_and_conditions
    assert_response :success
  end

end
