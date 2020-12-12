class ApplicationController < ActionController::Base

  include SessionsHelper  #Controller から Helper のメソッドを使うことはデフォルトではできません。
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end

#  ログイン要求処理!
#  ユーザの index, show はログインしていないユーザに対しては見せたくないので、
#  users#index, users#show のアクションには必ず事前に,
#  ログイン認証を確認するような処理を追加します。