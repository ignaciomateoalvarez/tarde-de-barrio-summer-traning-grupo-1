class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, presence: true, null: false
      t.string :lastname, presence: true, null: false
      t.integer :age, presence: true, null: false
      t.date :birth, presence: true, null: false
      t.string :address, presence: true, null: false
      t.integer :school_level, presence: true, null: false
      t.integer :go_to_school, presence: true, null: false
      t.timestamps
    end
  end
end
