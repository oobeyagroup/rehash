class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :recording_id
      t.string :item

      t.timestamps
    end
  end
end
