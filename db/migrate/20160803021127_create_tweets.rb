class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
        t.text :status
        t.timestamps null: false
    end
  end
end
