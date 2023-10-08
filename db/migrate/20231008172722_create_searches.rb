class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :query
      t.references :searchable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
