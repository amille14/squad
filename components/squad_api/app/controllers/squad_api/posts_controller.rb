class SquadApi::PostsController < SquadApi::BaseController
  before_action :find_room, only: [:index, :create]
  before_action :find_posts, only: [:index]
  before_action :find_post, only: [:show, :update, :delete]

  def index
    # TODO: Add pagination
    respond_to :json
  end

  def show
  end

  def create
  end

  def update
  end

  def delete
  end

private
  def find_posts
    @posts = @room.posts.includes(:post_users)
  end

  def find_post
    @post = Post.includes(:post_users).find(params[:id])
  end
end