class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { error: 'Key not found' }, status: 404
  end
end