class Api::LikesController < Api::ApiController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.likes.where(user_id: current_user.id).first_or_create

    unless @like.save
      puts @like.errors.inspect
      render json: { error: "Unable to create like" }, status: 422
    end
  end

  def destroy
    @like = @post.likes.where(user_id: current_user.id).destroy_all
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
