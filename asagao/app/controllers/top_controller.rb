class TopController < ApplicationController
  def index
  end
  
  def not_found
    raise ActionController::RoutingError,
      "No route matches #{request.path.inspect}"
  end
end
