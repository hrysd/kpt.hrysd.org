module API
  module Boards
    class ProblemsController < APIController
      include RemarksMethods

      self.kind = :problem
    end
  end
end
