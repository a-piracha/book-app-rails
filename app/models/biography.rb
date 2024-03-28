class Biography < ApplicationRecord
    belongs_to :author
    
    validates :age, 
    numericality: { greater_than_or_equal_to: 0 }
    validates :cnic, 
    presence: true, 
    format: { with:/\A\d{5}-\d{7}-\d{1}\z/ }, 
    uniqueness: true 
    validates :dob, 
    presence: true
    validates :bio, 
    length: { maximum: 500 } 
end