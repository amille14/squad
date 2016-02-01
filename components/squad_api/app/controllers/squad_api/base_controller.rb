class SquadApi::BaseController < ActionController::Base
  before_action :prepend_view_paths

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
end