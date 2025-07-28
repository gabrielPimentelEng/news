require "test_helper"

class SavedArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get saved_articles_index_url
    assert_response :success
  end

  test "should get create" do
    get saved_articles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get saved_articles_destroy_url
    assert_response :success
  end
end
