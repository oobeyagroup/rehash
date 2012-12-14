class AddImageToUser < ActiveRecord::Migration
  def change
        add_column :users, :twitter_profile_image, :string
  end
end
