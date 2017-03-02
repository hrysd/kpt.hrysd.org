module API
  module Boards
    module Remarks
      class ReactionsController < ActionController::API
        include BoardFindMethod

        def create
          board  = find_board
          remark = find_remark(board)

          remark.reactions.create!

          broadcast "#{remark.kind}:reacted", RemarkSerializer.new(remark).as_json

          head :created
        end

        private

        def find_remark(board)
          board.remarks.find(params[:remark_id])
        end

        def broadcast(event_name, data)
          Broadcaster.new("board_#{params[:permalink]}").broadcast(event_name, data)
        end
      end
    end
  end
end
