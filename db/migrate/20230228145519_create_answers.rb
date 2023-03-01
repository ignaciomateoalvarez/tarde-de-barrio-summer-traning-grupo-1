class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :reply
      t.references :comment, null: false
      t.references :user, null: false
      
      t.timestamps
    end
  end
end
