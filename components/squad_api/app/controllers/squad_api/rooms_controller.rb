class SquadApi::RoomsController < SquadApi::BaseController
  before_action :find_squad, only: [:index, :show, :create]
  before_action :find_rooms, only: [:index]
  before_action :find_room, only: [:show, :update, :delete]

  def index
    respond_to :json
  end

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
  def find_rooms
    @rooms = @squad.rooms
  end

  def find_room
    if @user.present?
      @room = @user.room
    else
      @room = Room.find(params[:id])
    end
  end
end