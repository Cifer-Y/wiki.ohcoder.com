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
    message = Message.new(message_params)
    message.tags.new(tag_params)
    if message.save
      redirect_to messages_path
    end
  end
  def destroy
    message = Message.find(params[:id])
    Tag.delete(message.tags)
    Tagging.delete(message.taggings)
    if message.destroy
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
