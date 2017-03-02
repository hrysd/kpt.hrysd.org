module Api
  module Boards
    class KeepsController < ActionController::API
      include RemarksMethods

      self.kind = :keep
    end
  end
end
