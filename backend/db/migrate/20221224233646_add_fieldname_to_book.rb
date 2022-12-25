class AddFieldnameToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :likes_books, :integer
  end
end
