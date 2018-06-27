class Api::LikesController < Api::ApiController
  before_action :authenticate_user!
  before_action :set_post

  def index
    @likes = Like.all
  end

  def create
    @like = current_user.likes.find_or_create_by!(post_id: @post.id)

    unless @like.save
      render json: { error: "Unable to create like" }, status: 422
    end
  end

  def destroy
    @like = current_user.likes.find_by!(post_id: @post.id)
    @like&.destroy

    head 204
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
