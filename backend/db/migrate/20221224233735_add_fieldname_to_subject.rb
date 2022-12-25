class AddFieldnameToSubject < ActiveRecord::Migration[7.0]
  def change
    remove_column :subjects, :likes_subjects
    add_column :subjects, :likes_subjects, :integer
  end
end
