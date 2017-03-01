module Api
  class TrisController < ActionController::API
    include RemarksMethods

    self.kind = :tri
  end
end
