class ApplicationController < ActionController::Base
  before_filter :require_login 
  protect_from_forgery

  class NotFound < StandardError; end

  if Rails.env.production?
    rescue_from ActionController::RoutingError, with: :rescue_404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
  end

  rescue_from NotFound, with: :rescue_404

private
   
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
  
  def rescue_404(exception)
    render "errors/not_found", status: 404, layout: "error", formats: [:html]
  end
end

  