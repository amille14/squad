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
  end

private
  def find_users
    @users = @squad.users
  end

  def find_user
    @user = User.includes(:squad_users).find(params[:id])
  end
end