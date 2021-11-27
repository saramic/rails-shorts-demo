class Url < ApplicationRecord
  has_many :stats, dependent: :destroy
end
