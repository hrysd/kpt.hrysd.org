module API
  module Boards
    class StatesController < APIController
      include BoardFindMethod

      def update
        board = find_board

        board.closed!

        broadcast "board:closed", BoardSerializer.new(board).as_json

        head :no_content
      end

      private

      def broadcast(event_name, data)
        Broadcaster.new("board_#{params[:permalink]}").broadcast(event_name, data)
      end
    end
  end
end
