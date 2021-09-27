class AddBookIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :BookId, :integer
  end
end
