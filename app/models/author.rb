class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    has_one :biography, dependent: :destroy

    accepts_nested_attributes_for :biography

    validates :name, presence: true, length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end