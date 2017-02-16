class RemarksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "board_#{params[:permalink]}"
  end
end
