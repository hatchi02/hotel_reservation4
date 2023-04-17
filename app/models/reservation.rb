class Reservation < ApplicationRecord
  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :guest, presence: true, numericality: true
  
  validate :checkin_check
  def checkin_check
    return if checkin.blank? || checkout.blank?
    errors.add(:checkout, "がチェックインより前の日付のため登録できません。") unless
    self.checkin <= self.checkout
  end

  belongs_to :room
  belongs_to :user
end
