class Remark < ApplicationRecord
  belongs_to :board

  validates :kind,    presence: true
  validates :content, presence: true
end
