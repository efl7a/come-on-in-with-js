class AddContentToStudySessions < ActiveRecord::Migration[5.1]
  def change
    add_column :study_sessions, :content, :string, :default => "Test Prep"
  end
end
