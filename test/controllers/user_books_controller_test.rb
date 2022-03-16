require 'test_helper'

class UserBooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end
  
  test "should post user_book create" do
    assert_difference('UserBook.count',1) do
      post user_books_path, params:{user_id:1,book_id:2,completed:false}
    end
    assert_redirected_to books_url
  end

  test "should put user_book update" do
    patch user_book_path(id:1, completed:true )
    assert_redirected_to books_url
  end
end
