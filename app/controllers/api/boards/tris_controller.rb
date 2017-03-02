module Api
  module Boards
    class TrisController < ActionController::API
      include RemarksMethods

      self.kind = :tri
    end
  end
end
