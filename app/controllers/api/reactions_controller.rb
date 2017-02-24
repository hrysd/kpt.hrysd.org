module Api
  class ReactionsController < ActionController::API
    def create
      board  = find_board
      remark = find_remark(board)

      remark.reactions.create!

      broadcast "#{remark.kind}:reacted", remark.as_json(methods: :reactions_count)

      head :created
    end

    private

    def find_board
      Board.find_by!(permalink: params[:permalink])
    end

    def find_remark(board)
      board.remarks.find(params[:remark_id])
    end

    def broadcast(event_name, data)
      Broadcaster.new("board_#{params[:permalink]}").broadcast(event_name, data)
    end
  end
end
