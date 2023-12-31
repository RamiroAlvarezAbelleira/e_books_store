class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :firstname
      t.string :lastname
      t.date :date_of_birth
      t.text :about
      t.string :nationality

      t.timestamps
    end
  end
end
