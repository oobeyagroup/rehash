class AddUserIdToRecording < ActiveRecord::Migration
  def change
            add_column :recordings, :user_id, :integer
  end
end
