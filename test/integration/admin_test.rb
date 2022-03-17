require 'test_helper'

class AdminTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:one)
    get '/users/sign_in'
    sign_in users(:two)
    post user_session_url
  end

  test "creating a book as admin" do
    get books_url
    assert_response :success
    assert_difference 'Book.count', 1 do
      post books_url, params:{ book:{title:"test", author:"testing"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "test", response.body
  end

  test "updaing book as an admin" do
    get books_url
    assert_response :success
    put book_url(@book), params: { book: { title:"testing",author:"testing test file"} }
    assert_response :redirect
    follow_redirect!
    assert_match "testing", response.body
    assert_match "testing test file", response.body
  end

  test "delete book as an admin" do
    get books_url
    assert_response :success
    assert_match "book1", response.body
    assert_match "author1", response.body
    assert_difference('Book.count', -1) do
      delete book_url(@book)
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_no_match "book1", response.body
    assert_no_match "author1", response.body
  end
end