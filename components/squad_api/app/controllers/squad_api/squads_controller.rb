class SquadApi::SquadsController < SquadApi::BaseController
  before_action :find_squad, only: [:show, :update, :delete]

  def show
    respond_to :json
  end

  def update
  end

  def delete
  end

  def add_user
    @squad.add_user params[:user_id], params[:permissions]
  end

  def remove_user
    @squad.remove_user params[:user_id]
  end

private
  def find_squad
    @squad = Squad.find(params[:id])
  end
end