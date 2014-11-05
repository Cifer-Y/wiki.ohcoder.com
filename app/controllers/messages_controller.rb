class MessagesController < ApplicationController
  def index
    @tags = Tag.all
    @messages = Message.all
  end
  def new
    @tag = Tag.new
    @message = Message.new
  end
  def create
    message = Message.new(message_params)
    message.tags.new(tag_params) unless Tag.find_by_tag(tag_params[:tag])
    if message.save
      redirect_to messages_path
    end
  end
  def destroy
    message = Message.find(params[:id])
    if Tag.delete(message.tags) && message.destroy
      redirect_to messages_path
    end
  end

  # Tags
  def tags_show
    @tags = Tag.find(params[:id])
  end

  private
    def message_params
      params.require(:message).permit(:content, :site_name, :site_link)
    end
    def tag_params
      params.require(:message).permit(:tag)
    end
end
