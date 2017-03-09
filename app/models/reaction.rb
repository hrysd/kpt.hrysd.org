class Reaction < ApplicationRecord
  belongs_to :remark, counter_cache: true
end
