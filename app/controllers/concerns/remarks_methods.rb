module RemarksMethods
  extend ActiveSupport::Concern

  included do
    class_attribute :kind
  end

  def create
    board = find_board

    remark = board.remarks.create!(remark_params.merge(kind: kind))

    broadcast "#{kind}:created", remark

    head :created
  end

  def destroy
    board  = find_board
    remark = find_remark(board)

    remark.destroy!

    broadcast "#{kind}:deleted", id: remark.id, kind: remark.kind

    head :no_content
  end

  private

  def find_board
    Board.find_by!(permalink: params[:permalink])
  end

  def find_remark(board)
    board.remarks.find(params[:id])
  end

  def remark_params
    params.require(kind).permit(:content)
  end

  def broadcast(event_name, data)
    Broadcaster.new("board_#{params[:permalink]}").broadcast(event_name, data)
  end
end
