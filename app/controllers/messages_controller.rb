class MessagesController < ApplicationController
  def index
    @tags = Tag.all
    @tags = Tag.remove_dup(@tags) if Tag.count > 0
    if params[:tag]
      @messages = Message.tag_with(params[:tag])
    else
      @messages = Message.all
    end
  end

  def create
    message = current_user.messages.new(message_params)
    message.tags.new(tag_params)
    redirect_to messages_path if message.save
  end

  def destroy
    message = current_user.messages.find(params[:id])
    redirect_to messages_path if message.destroy
  end

  private
    def message_params
      params.require(:message).permit(:content, :site_name, :site_link)
    end
    def tag_params
      params.require(:message).permit(:tag)
    end
end
