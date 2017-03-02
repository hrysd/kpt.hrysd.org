module API
  class BoardsController < APIController
    def show
      board = Board.find_by!(permalink: params[:permalink])

      render json: board, serializer: BoardSerializer
    end
  end
end
