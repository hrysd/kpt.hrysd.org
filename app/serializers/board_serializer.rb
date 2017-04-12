class BoardSerializer < ActiveModel::Serializer
  has_many :keeps do
    object.remarks.keep.created_at_asc
  end

  has_many :problems do
    object.remarks.problem.created_at_asc
  end

  has_many :tris do
    object.remarks.tri.created_at_asc
  end

  attributes :id, :title, :permalink, :state
end
