class RemarkSerializer < ActiveModel::Serializer
  attributes :id, :kind, :content, :reactions_count
end
