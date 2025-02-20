class CreateFlavors < ActiveRecord::Migration[7.2]
  def change
    create_table :flavors do |t|
      t.string :name
      t.text :description
      t.decimal :price_per_kg

      t.timestamps
    end
  end
end
