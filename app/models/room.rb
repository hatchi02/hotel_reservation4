class Room < ApplicationRecord
  validates :name, presence: true
  validates :detail, presence: true
  validates :charge, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
  
  belongs_to :user
  has_many :reservation

  mount_uploader :image, ImageUploader
end
