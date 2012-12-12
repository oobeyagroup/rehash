class AddDatetextAndTimetextToRecording < ActiveRecord::Migration
  def change
        add_column :recordings, :date_text, :string
        add_column :recordings, :time_text, :string
  end
end
