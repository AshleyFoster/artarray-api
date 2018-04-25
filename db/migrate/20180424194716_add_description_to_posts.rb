class AddDescriptionToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :description, :text, null: false
    add_reference :posts, :user, index: true
  end
end
