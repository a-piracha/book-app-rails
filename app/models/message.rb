class Message < ApplicationRecord
    # belongs_to :conversation

    validates :content, presence: true, length: { maximum: 100 }

end