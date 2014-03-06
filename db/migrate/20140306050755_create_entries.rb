class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.boolean :chosen

      t.timestamps
    end
  end
end
