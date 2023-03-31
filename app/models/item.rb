class Item < ApplicationRecord
    validates :name, :photo, :description, presence: true

    validates :name, length: { minimum: 3, maximum: 70 }
    validates :photo, length: { minimum: 3, maximum: 5_000 }
    validates :description, length: { minimum: 3, maximum: 1_000 }
    validates :photo, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https data])}\z/,
                               message: 'must be a valid URL' }
end