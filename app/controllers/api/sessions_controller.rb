class Api::SessionsController < Devise::SessionsController
  respond_to :json
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
    user = User.where(email: params[:user][:email]).first

    if user && user.valid_password?(params[:user][:password])
      render json: user.as_json(only: [:email, :password, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    current_user && current_user.authentication_token = nil
    if current_user && current_user.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
end
