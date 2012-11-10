class CreateTweetstores < ActiveRecord::Migration
  def change
    create_table :tweetstores do |t|
      t.string :name
      t.string :screen_name
      t.string :text
      t.string :profile_image_url
      t.datetime :tweeted_at

      t.timestamps
    end
  end
end
