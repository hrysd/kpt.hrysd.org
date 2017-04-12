require 'securerandom'

class Board < ApplicationRecord
  has_many :remarks, dependent: :destroy
  has_many :keeps,    -> { keep },    class_name: 'Remark'
  has_many :problems, -> { problem }, class_name: 'Remark'
  has_many :tris,     -> { tri },     class_name: 'Remark'

  enum state: {opened: 0, closed: 1}

  scope :created_at_asc, -> { order(created_at: :asc) }

  validates :title,     presence: true, length: {maximum: 255}
  validates :permalink, presence: true, length: {maximum: 255}, uniqueness: true

  before_validation :set_permalink

  def to_param
    permalink
  end

  def clear_permalink
    self.permalink = nil
  end

  private

  def set_permalink
    self.permalink = SecureRandom.uuid if permalink.blank?
  end
end
