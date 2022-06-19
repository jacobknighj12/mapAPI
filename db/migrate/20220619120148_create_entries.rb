class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :upload
      t.integer :download

      t.timestamps
    end
  end
end
