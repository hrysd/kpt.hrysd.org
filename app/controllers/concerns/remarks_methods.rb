module RemarksMethods
  extend ActiveSupport::Concern

  included do
    class_attribute :kind
  end

  def create
    board = find_board

    remark = board.remarks.create!(remark_params.merge(kind: kind))

    render json: remark
  end

  private

  def find_board
    Board.find_by(permalink: params[:permalink])
  end

  def remark_params
    params.require(kind).permit(:content)
  end
end
