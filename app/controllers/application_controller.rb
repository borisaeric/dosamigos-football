class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    redirect_to '/404'
  end
end
