class SquadsController < ApplicationController
  before_action :find_current_user

  layout "squads"

  def index
    @squads = @current_user.squads
    respond_to :html
  end

  def show
    session[:squad_id] = params[:id]
    redirect_to "/"
  end

  def create
    # @squad = Squad.create!(name: params[:name])
    # @squad.add_user @current_user.id, :leader
    # session[:squad_id] = @squad.id
    # redirect_to :bootstrap
  end

  def bootstrap
    @squad = @current_user.squads.where(id: session[:squad_id]).first if session[:squad_id]

    if @squad.present?
      respond_to :html
    else
      session[:squad_id] = nil
      redirect_to "/squads"
    end
  end

private
  def find_current_user
    # @current_user = current_user
    @current_user = User.find(1)
  end
end
