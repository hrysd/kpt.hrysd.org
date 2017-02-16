module RemarksMethods
  extend ActiveSupport::Concern

  included do
    class_attribute :kind
  end

  def create
    board = find_board

    remark = board.remarks.create!(remark_params.merge(kind: kind))

    broadcast_remark remark

    head :created
  end

  private

  def find_board
    Board.find_by(permalink: params[:permalink])
  end

  def remark_params
    params.require(kind).permit(:content)
  end

  def broadcast_remark(remark)
    ActionCable.server.broadcast "board_#{params[:permalink]}", remark
  end
end
