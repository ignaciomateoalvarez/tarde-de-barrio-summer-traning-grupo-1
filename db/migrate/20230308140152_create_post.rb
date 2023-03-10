class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.references :user, null: false
      
      t.timestamps
    end
  end
end
