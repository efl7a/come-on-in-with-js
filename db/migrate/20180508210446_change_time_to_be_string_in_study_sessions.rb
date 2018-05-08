class ChangeTimeToBeStringInStudySessions < ActiveRecord::Migration[5.1]
  def change
    change_column :study_sessions, :time, :string, :default => "8:00" 
  end
end
