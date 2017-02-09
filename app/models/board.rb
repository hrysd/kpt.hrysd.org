require 'securerandom'

class Board < ApplicationRecord
  validates :title,     presence: true
  validates :permalink, presence: true

  before_validation :set_permalink

  def to_param
    permalink
  end

  private

  def set_permalink
    self.permalink = SecureRandom.uuid if permalink.blank?
  end
end
