class AddHighlightToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :highlight, :boolean, default: false
  end
end
