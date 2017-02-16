module Api
  class TriesController < ActionController::API
    include RemarksMethods

    self.kind = :tri
  end
end
