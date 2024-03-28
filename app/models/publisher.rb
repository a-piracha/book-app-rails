class Publisher < ApplicationRecord
    has_many :books, dependent: :nullify

    validates :name, presence: true, length: { maximum: 50 }
    validates :address, presence: true,length: { maximum: 255 }

end