module Api
  module Boards
    class ProblemsController < ActionController::API
      include RemarksMethods

      self.kind = :problem
    end
  end
end
