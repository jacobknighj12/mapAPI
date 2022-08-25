class AddLatToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :lat, :decimal
  end
end
