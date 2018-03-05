class CreateStudySessions < ActiveRecord::Migration[5.1]
  def change
    create_table :study_sessions do |t|
      t.string :subject
      t.integer :grade
      t.belongs_to :user
      t.date  :date
      t.time :time
      t.timestamps
    end
  end
end
