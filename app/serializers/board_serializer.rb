class BoardSerializer < ActiveModel::Serializer
  has_many :keeps do
    object.remarks.keep
  end

  has_many :problems do
    object.remarks.problem
  end

  has_many :tris do
    object.remarks.tri
  end

  attributes :id, :title, :permalink, :state
end
