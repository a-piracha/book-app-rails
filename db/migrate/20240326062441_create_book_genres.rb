class CreateBookGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :book_genres do |t|
      t.references :book, null: true, foreign_key: true
      t.references :genre, null: true, foreign_key: true

      t.timestamps
    end
  end
end
