require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers 

  setup do
    @book = books(:one)
    get '/users/sign_in'
    sign_in users(:two)
    post user_session_url
  end

  test "should get book index" do
    get books_url
    assert_response :success
  end  

  test "should get book new" do
    get new_book_url
    assert_response :success
  end

  test "should get book show" do
    get book_url(@book)
    assert_response :success
  end 
  
  test "should post book create" do
    assert_difference('Book.count',1) do
      post books_url, params:{ book:{title:"test", author:"testing"}}
    end
    assert_redirected_to books_url
  end

  test "should get book edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should put book update" do
    put book_url(@book), params: { book: { title:"testing",description:"testing test file"} }
    assert_redirected_to book_url, params: { book: { id:1 } }
  end

  test "should delete book destroy" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end

end
