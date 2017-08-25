class Tweet < ActiveRecord::Base
     has_many :emojitweets
     has_many :emojis, through: :emojitweets
     has_many :users, through: :emojitweets
     has_many :comments
     validates_associated :emojitweets, :emojis, :users, :comments
end
