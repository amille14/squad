class SquadApi::MessagesController < SquadApi::BaseController
  before_action :find_room, only: [:index, :create]
  before_action :find_post, only: [:index, :create]
  before_action :find_messages, only: [:index]
  before_action :find_message, only: [:update, :delete]

  def index
    # TODO: Add pagination
    respond_to :json
  end

  def create
  end

  def update
  end

  def delete
  end

private
  def find_messages
    if @post.present?
      @messages = @post.messages
    else
      @messages = @room.messages
    end
  end

  def find_message
    @message = Message.find params[:id]
  end
end