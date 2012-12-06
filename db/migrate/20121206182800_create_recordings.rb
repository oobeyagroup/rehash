class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :name
      t.datetime :start
      t.datetime :duration
      t.string :criteria
      t.string :uid
      t.text :rehash

      t.timestamps
    end
  end
end
