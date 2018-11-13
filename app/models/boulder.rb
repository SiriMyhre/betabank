class Boulder < ApplicationRecord
  has_many :videos, dependent: :destroy
end
