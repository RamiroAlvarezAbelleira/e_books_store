class DropAdmin < ActiveRecord::Migration[7.0]
  def up
    drop_table :admins
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
