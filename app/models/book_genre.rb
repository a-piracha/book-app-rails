class BookGenre < ApplicationRecord
    belongs_to :book, class_name: "Book"
    belongs_to :genre, class_name:"Genre"
end