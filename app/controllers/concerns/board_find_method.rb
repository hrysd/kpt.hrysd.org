module BoardFindMethod
  private

  def find_board
    Board.opened.find_by!(permalink: params[:permalink])
  end
end
