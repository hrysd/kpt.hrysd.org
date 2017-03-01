module Api
  class BoardsController < ActionController::API
    def show
      board = Board.find_by!(permalink: params[:permalink])

      render json: board, serializer: BoardSerializer
    end
  end
end
