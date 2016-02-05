class SquadApi::BaseController < ActionController::Base
  before_action :prepend_view_paths
  before_action :find_current_user

  def prepend_view_paths
    prepend_view_path "components/squad_api/app/views/"
  end

protected
  def find_squad
    if params[:squad_id]
      @squad = Squad.find(params[:squad_id])
    end
  end

  def find_user
    if params[:user_id]
      @user = User.includes(:room_users).find(params[:user_id])
    end
  end

  def find_room
    if @user.present?
      @room = @user.room
    else
      @room = Room.find(params[:room_id])
    end
  end

  def find_post
    if params[:post_id]
      @post = Post.find(params[:post_id])
    end
  end

  def find_current_user
    # TODO: Change when devise is implemented
    # @current_user = current_user
    @current_user = User.find(1)
  end
end