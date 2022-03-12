require "test_helper"

class SubDistrictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_district = sub_districts(:one)
  end

  test "should get index" do
    get sub_districts_url, as: :json
    assert_response :success
  end

  test "should create sub_district" do
    assert_difference("SubDistrict.count") do
      post sub_districts_url, params: { sub_district: { code: @sub_district.code, district_id: @sub_district.district_id, name: @sub_district.name, name_th: @sub_district.name_th, post_code: @sub_district.post_code } }, as: :json
    end

    assert_response :created
  end

  test "should show sub_district" do
    get sub_district_url(@sub_district), as: :json
    assert_response :success
  end

  test "should update sub_district" do
    patch sub_district_url(@sub_district), params: { sub_district: { code: @sub_district.code, district_id: @sub_district.district_id, name: @sub_district.name, name_th: @sub_district.name_th, post_code: @sub_district.post_code } }, as: :json
    assert_response :success
  end

  test "should destroy sub_district" do
    assert_difference("SubDistrict.count", -1) do
      delete sub_district_url(@sub_district), as: :json
    end

    assert_response :no_content
  end
end
