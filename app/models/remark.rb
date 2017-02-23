class Remark < ApplicationRecord
  belongs_to :board

  validates :kind,    presence: true
  validates :content, presence: true, length: {maximum: 255}

  enum kind: {
    keep:    0,
    problem: 1,
    tri:     2 # XXX
  }
end
