require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test 'invalid signup information' do
    get signup_path
    # ブロック内の処理実行直前と、実行後でUser.countの値が変更ないか
    # この場合は登録に失敗するため、値に変更がないことが正しい
    assert_no_difference 'User.count' do
      params = {
        user: {
          name: '',
          email: 'user@invalid',
          password: 'foo',
          password_confirmation: 'bar'
        }
      }

      post users_path, params: params
      assert_template 'users/new'
      assert_select 'div#error_explanation'
      assert_select 'div.alert.alert-danger'
    end
  end

  test 'valid signup information' do
    get signup_path
    # ブロック内の処理実行直前と、実行後のUser.countの値を比較する
    # この場合はUsersテーブルに1つレコードが追加されるかを比較している
    assert_difference 'User.count', 1 do
      params = {
        user: {
          name: 'Example User',
          email: 'user@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
      post users_path, params: params
    end
    follow_redirect! # POSTの送信結果を以ってリダイレクト先に遷移するメソッド
    assert_template 'users/show'
    assert flash[:success]
  end
end
