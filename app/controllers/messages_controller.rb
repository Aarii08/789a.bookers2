class MessagesController < ApplicationController

  before_action :authenticate_user!, :onyl => [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.new(message_params)
      @message.user_id = current_user.id
      @message.save
     
      # redirect_to "/rooms/#{@message.room_id}"
    end
      # redirect_back(fallback_location: root_path)
      render :validater unless @message.save
  end
  
  private
  
  def message_params
      params.require(:message).permit(:user_id, :room_id, :message)
  end
  


end