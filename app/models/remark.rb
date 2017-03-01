class Remark < ApplicationRecord
  belongs_to :board

  has_many :reactions, dependent: :destroy

  validates :kind,    presence: true
  validates :content, presence: true, length: {maximum: 255}

  enum kind: {
    keep:    0,
    problem: 1,
    tri:     2 # XXX
  }

  # TODO: Counter cache
  def reactions_count
    reactions.count
  end
end
