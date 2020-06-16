class Api::V1::MessagesController < ApplicationController

  before_action :authenticate, only: [:get_messages, :create]

  def get_messages
    if current_user
      render json: current_user.get_messages_with(current_user.id, message_params[:userId])
    else
      render json: { msg: 'Could not authenticate user' }, status: :unauthorized
    end
  end

  def create
    if current_user
      message = Message.new(sender_id: current_user.id, recipient_id: message_params[:userId], content: message_params[:content])
      if message.save
        render json: message
      end
    else
      render json: { msg: 'Could not authenticate user' }, status: :unauthorized
    end
  end

  private

  def message_params
    params.require(:message).permit(:userId, :content)
  end

end
