class Room < ApplicationRecord
  validates :name, presence: true
  validates :detail, presence: true
  validates :charge, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
end
