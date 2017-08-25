class Comment < ApplicationRecord
    belongs_to :tweet
    belongs_to :user
    validates :post, presence: true
    validates :post, length: { minimum: 1 }
end
