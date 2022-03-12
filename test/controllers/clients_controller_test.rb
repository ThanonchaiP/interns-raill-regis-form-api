require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url, as: :json
    assert_response :success
  end

  test "should create client" do
    assert_difference("Client.count") do
      post clients_url, params: { client: { birthday: @client.birthday, email: @client.email, first_name: @client.first_name, gender_id: @client.gender_id, last_name: @client.last_name, phone: @client.phone, race_id: @client.race_id, shirt_size_id: @client.shirt_size_id } }, as: :json
    end

    assert_response :created
  end

  test "should show client" do
    get client_url(@client), as: :json
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { birthday: @client.birthday, email: @client.email, first_name: @client.first_name, gender_id: @client.gender_id, last_name: @client.last_name, phone: @client.phone, race_id: @client.race_id, shirt_size_id: @client.shirt_size_id } }, as: :json
    assert_response :success
  end

  test "should destroy client" do
    assert_difference("Client.count", -1) do
      delete client_url(@client), as: :json
    end

    assert_response :no_content
  end
end
