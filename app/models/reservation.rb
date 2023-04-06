class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :date, presence: true
  validates :city, presence: true
  validates :item, presence: true
  validates :user, presence: true
end
