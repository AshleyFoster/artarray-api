class Api::PostsController < Api::ApiController
  before_action :authenticate_api_user!, only: [ :create ]
  def index
    respond_to do |format|
      format.json
    end
  end
end
