class CreateAttendance < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.date :date
      t.integer :state
      t.references :student, null: false

      t.timestamps
    end
  end
end
