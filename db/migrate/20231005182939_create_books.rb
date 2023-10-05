class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.string :isbn, unique: true
      t.date :date_of_publication
      t.text :review
      t.decimal :price

      t.timestamps
    end
  end
end
