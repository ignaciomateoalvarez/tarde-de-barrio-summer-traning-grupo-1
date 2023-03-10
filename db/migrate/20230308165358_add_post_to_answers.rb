class AddPostToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :post_id, :integer
  end
end
