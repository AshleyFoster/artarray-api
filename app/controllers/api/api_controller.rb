class Api::ApiController < ActionController::Base
  before_action :set_default_response_format
  acts_as_token_authentication_handler_for User

  private

  def render_errors(model)
    render status: 422, json: { errors: model.errors.full_messages }
    render status: 401, json: { errors: [{detail: 'Access denied'}] }
  end

  def set_default_response_format
    request.format = :json
  end
end
