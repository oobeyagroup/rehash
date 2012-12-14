class AddEndTimeToRecordings < ActiveRecord::Migration
  def change
        add_column :recordings, :end_time, :datetime
  end
end
