require "test_helper"

class ShirtSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shirt_size = shirt_sizes(:one)
  end

  test "should get index" do
    get shirt_sizes_url, as: :json
    assert_response :success
  end

  test "should create shirt_size" do
    assert_difference("ShirtSize.count") do
      post shirt_sizes_url, params: { shirt_size: { chest: @shirt_size.chest, size: @shirt_size.size } }, as: :json
    end

    assert_response :created
  end

  test "should show shirt_size" do
    get shirt_size_url(@shirt_size), as: :json
    assert_response :success
  end

  test "should update shirt_size" do
    patch shirt_size_url(@shirt_size), params: { shirt_size: { chest: @shirt_size.chest, size: @shirt_size.size } }, as: :json
    assert_response :success
  end

  test "should destroy shirt_size" do
    assert_difference("ShirtSize.count", -1) do
      delete shirt_size_url(@shirt_size), as: :json
    end

    assert_response :no_content
  end
end
