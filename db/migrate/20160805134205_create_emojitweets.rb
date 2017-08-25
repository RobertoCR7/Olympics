class CreateEmojitweets < ActiveRecord::Migration[5.0]
  def change
    create_table :emojitweets do |t|
        t.integer :user_id
        t.integer :tweet_id
        t.integer :emoji_id
      t.timestamps
    end
  end
end
