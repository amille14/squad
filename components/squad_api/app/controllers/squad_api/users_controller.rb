class SquadApi::UsersController < SquadApi::BaseController
  before_action :find_squad, only: [:index, :show]
  before_action :find_users, only: [:index]
  before_action :find_user, only: [:show, :update]

  def index
    respond_to :json
  end

  def show
    respond_to :json
  end

  def update
    # TODO: Update both user and squad_user
  end

private
  def find_users
    @users = @squad.users
  end

  def find_user
    @user = User.includes(:squad_users).find(params[:id])
  end

  # TODO: Strong params for users
  def user_params
  end

  # TODO: Strong params for squad_users
  def squad_user_params
  end
end