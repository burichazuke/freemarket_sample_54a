class ApplicationController < ActionController::Base
  before_action :set_category
  # 本番環境で使います（Basic認証）
  before_action :basic_auth, if: :production?

  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_category
    @parents = Category.all.order('id ASC').limit(13)
  end
end
