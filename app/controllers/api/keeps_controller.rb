module Api
  class KeepsController < ActionController::API
    include RemarksMethods

    self.kind = :keep
  end
end
