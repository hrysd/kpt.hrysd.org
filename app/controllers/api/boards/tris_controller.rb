module API
  module Boards
    class TrisController < APIController
      include RemarksMethods

      self.kind = :tri
    end
  end
end
