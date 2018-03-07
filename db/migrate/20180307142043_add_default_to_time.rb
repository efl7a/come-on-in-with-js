class AddDefaultToTime < ActiveRecord::Migration[5.1]
  def change
    change_column_default :study_sessions, :time, "8:00"
  end
end
