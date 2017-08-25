class Emojitweet < ApplicationRecord
    belongs_to :emoji
    belongs_to :tweet, counter_cache: true
    belongs_to :user
end
