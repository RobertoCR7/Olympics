class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    has_many :emojitweets
    has_many :tweets, through: :emojitweets
    has_many :emojis, through: :emojitweets
    has_many :comments
    validates_associated :emojitweets, :tweets, :emojis, :comments
end
