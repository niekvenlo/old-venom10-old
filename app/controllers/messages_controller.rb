class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
      if @message.save
        render json: @message
      else
        render json: @message.errors.full_messages
      end
    end

    private

    def message_params
        params.require(:message).permit(:group_id, :content).merge(user_id: helpers.current_user.id)
    end

end