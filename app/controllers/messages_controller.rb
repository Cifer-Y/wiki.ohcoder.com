class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def create
    @tag = Tag.new(tag_params)
    @message = Message.new(message_params)
    if @message.save && @tag.save
      redirect_to messages_path
    end
  end
  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      redirect_to messages_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :site_name, :site_link)
    end
    def tag_params
      params.require(:message).permit(:tag)
    end
end
