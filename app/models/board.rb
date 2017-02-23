require 'securerandom'

class Board < ApplicationRecord
  has_many :remarks

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
