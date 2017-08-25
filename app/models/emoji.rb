class Emoji < ActiveRecord::Base
    has_many :emojitweets
    has_many :tweets, through: :emojitweets
    has_many :users, through: :emojitweets
    validates_associated :emojitweets, :tweets, :users
end
