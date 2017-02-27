module Api
  class BoardsController < ActionController::API
    def show
      board = Board.find_by!(permalink: params[:permalink])

      render json: board.as_json(methods: %i(keeps problems tries))
    end
  end
end