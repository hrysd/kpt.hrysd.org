require 'securerandom'

class Board < ApplicationRecord
  has_many :remarks
  has_many :keeps,    -> { keep },    class_name: 'Remark'
  has_many :problems, -> { problem }, class_name: 'Remark'
  has_many :tris,     -> { tri },     class_name: 'Remark'

  enum state: {opened: 0, closed: 1}

  validates :title,     presence: true, length: {maximum: 255}
  validates :permalink, presence: true, length: {maximum: 255}

  before_validation :set_permalink

  def to_param
    permalink
  end

  private

  def set_permalink
    self.permalink = SecureRandom.uuid if permalink.blank?
  end
end
