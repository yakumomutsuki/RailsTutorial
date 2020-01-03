require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  test "should get root" do
    get root_url
    assert_response :success
    # header要素があり、かつdiv -> a要素内のテキストが一致するか
    assert_select "header div a", "sample app"
    # footer要素があるか
    assert_select "footer"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  # Exercise : Contactページの作成
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
