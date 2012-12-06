class RemoveRehashFromRecording < ActiveRecord::Migration
  def up
  	remove_column :recordings, :rehash
  end

  def down
  end
end
