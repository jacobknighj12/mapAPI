class AddLngToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :lng, :decimal
  end
end
