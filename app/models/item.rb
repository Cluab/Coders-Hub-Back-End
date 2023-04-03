class Item < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
