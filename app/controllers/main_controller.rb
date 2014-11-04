class MainController < ApplicationController
  def index
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to main_index_path
    end
  end
  def edit
  end
  def update
  end
  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      redirect_to main_index_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :site_name, :site_link)
    end
end
