class CreatePriceUpdateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :price_update_statuses do |t|
      t.boolean :price_update_completed, default: false

      t.timestamps
    end
  end
end
