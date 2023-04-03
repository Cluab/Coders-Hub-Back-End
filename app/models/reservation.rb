class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :date, presence: true
  validates :city, presence: true
end
