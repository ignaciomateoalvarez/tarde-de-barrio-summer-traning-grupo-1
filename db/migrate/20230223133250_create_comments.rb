class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :student, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
