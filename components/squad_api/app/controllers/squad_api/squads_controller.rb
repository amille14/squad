class SquadApi::SquadsController < SquadApi::BaseController
  before_action :find_squad, only: [:show, :update, :delete]

  def show
    respond_to :json
  end

  def create
  end

  def update
  end

  def delete
  end

private
  def find_squad
    @squad = Squad.find(params[:id])
  end
end