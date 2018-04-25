class Api::PostsController < Api::ApiController
  respond_to :json

  def index
    @posts = Post.with_attached_image.order("created_at DESC")
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.image.attach(io: image_io, filename: "image")

    unless @post.save
      puts @post.errors.inspect
      render json: { error: "Unable to create post" }, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def image_io
    decoded_image = Base64.decode64(params[:post][:image])
    StringIO.new(decoded_image)
  end
end
