require "test_helper"

class ProvincesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @province = provinces(:one)
  end

  test "should get index" do
    get provinces_url, as: :json
    assert_response :success
  end

  test "should create province" do
    assert_difference("Province.count") do
      post provinces_url, params: { province: { code: @province.code, name: @province.name, name_th: @province.name_th } }, as: :json
    end

    assert_response :created
  end

  test "should show province" do
    get province_url(@province), as: :json
    assert_response :success
  end

  test "should update province" do
    patch province_url(@province), params: { province: { code: @province.code, name: @province.name, name_th: @province.name_th } }, as: :json
    assert_response :success
  end

  test "should destroy province" do
    assert_difference("Province.count", -1) do
      delete province_url(@province), as: :json
    end

    assert_response :no_content
  end
end
