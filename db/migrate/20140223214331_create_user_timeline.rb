class CreateUserTimeline < ActiveRecord::Migration
  def up
    create_table :user_timelines do |t|
      t.datetime :created_at
      t.integer :id
      t.string :id_str
      t.text :text
      t.text :source
      t.boolean :truncated
      t.integer :in_reply_to_status_id
      t.string :in_reply_to_status_id_str
      t.integer :in_reply_to_user_id
      t.string :in_reply_to_user_id_str
      t.string :in_reply_to_screen_name
      t.text :geo
      t.text :coordinates
      t.text :place
      t.text :contributors
      t.integer :retweet_count
      t.integer :favorite_count
      t.boolean :favorited
      t.boolean :retweeted
      t.boolean :possibly_sensitive
      t.string :lang

      t.timestamps
    end
  end

  def down
  end
end
