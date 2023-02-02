class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, presence: true, null: false
      t.string :last_name, presence: true, null: false
      t.string :mail, presence: true, unique: true, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
