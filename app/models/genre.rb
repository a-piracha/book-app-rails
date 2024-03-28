class Genre < ApplicationRecord
    has_many :book_genres, dependent: :nullify
    has_many :books, through: :book_genres
    validates :name, presence: true, length: { minimum: 3, maximum: 100 } 
end