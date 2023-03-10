class ChangeCommentIdInAnswer < ActiveRecord::Migration[7.0]
  def change
    change_column_null :answers, :comment_id, true 
  end
end
