class Book < ApplicationRecord
    belongs_to :author
    belongs_to :publisher, optional: true

    has_many :book_genres, dependent: :nullify
    has_many :genres, through: :book_genres

    validates :name, presence: true, length: { minimum: 3, maximum: 100 } 
    validates :description, presence: true, length: { maximum: 1000 }
    validates :price, presence: true, numericality: { greater_than: 0 }
end