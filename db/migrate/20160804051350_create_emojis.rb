class CreateEmojis < ActiveRecord::Migration[5.0]
  def change
    create_table :emojis do |t|
        t.string :face
        t.string :description
        t.string :aliases
        t.string :tags
    end
  end
end
