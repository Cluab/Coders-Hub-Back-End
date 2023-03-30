class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :date, :city, presence: true
end
