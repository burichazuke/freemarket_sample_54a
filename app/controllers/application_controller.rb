class ApplicationController < ActionController::Base
  # 本番環境で使います（Basic認証）
  # before_action :basic_auth

  # private

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'admin' && password == '2222'
  #   end
  # end
end
