module Api
  class ProblemsController < ActionController::API
    include RemarksMethods

    self.kind = :problem
  end
end

