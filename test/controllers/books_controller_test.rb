require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_index_url
    assert_response :success
  end

  test "should get get_reviews_by_title" do
    get books_get_reviews_by_title_url
    assert_response :success
  end

end
