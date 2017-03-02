module API
  module Boards
    class KeepsController < APIController
      include RemarksMethods

      self.kind = :keep
    end
  end
end
