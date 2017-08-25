class AddEmojiTweetCount < ActiveRecord::Migration[5.0]
  def change
      add_column :tweets, :emojitweets_count, :integer, default: 0
  end
end
